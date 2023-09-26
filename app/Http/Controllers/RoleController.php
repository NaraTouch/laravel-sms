<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Models\SysRole;
use Carbon\Carbon;
use DB;

class RoleController extends Controller
{
    // Admin Login Controller
    public function RoleView()
    {
        $allData = SysRole::all();
        return view("backend.admin.role.role_view", compact("allData"));
    }

    public function RoleAdd()
    {
        $allData = SysRole::RoleList();
        if ($allData) {
            $allData = $allData->sortBy('group');
        }
        return view('backend.admin.role.role_add', compact("allData"));
    }

    public function RoleAddStore(Request $request)
    {
        
        $sysRole = SysRole::insertGetId([
            "name" => $request->name,
            "status" => $request->status,
            "description" => $request->description,
            "created_at" => Carbon::now(),
            "updated_at" => Carbon::now(),
        ]);
        $role_id = $sysRole;
        $module = self::SysRoleModuleData($request->module, $role_id);
        $method = self::SysRoleMethodData($request->method, $role_id);
        if ($module) {
            self::saveArray('sys_role_module', $module);
        }
        if ($method) {
            self::saveArray('sys_role_method', $method);
        }
        $notification = array(
			'message' => 'Role Create Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('role.view')->with($notification);
    }

    private static function SysRoleModuleData($module = [], $role_id = null)
    {
        if (!$module || !$role_id) {
            return false;
        }
        $data = [];
        foreach ($module as $key => $value) {
            $data[] = [
                'role_id' => $role_id,
                'module_id' => $value,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ];
        }
        return $data;
    }

    private static function SysRoleMethodData($method = [], $role_id = null)
    {
        if (!$method || !$role_id) {
            return false;
        }
        $data = [];
        foreach ($method as $key => $value) {
            $data[] = [
                'role_id' => $role_id,
                'method_id' => $value,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ];
        }
        return $data;
    }

    public function RoleEdit($id)
    {
        $editData = SysRole::find($id);
        $editData['permission'] = SysRole::RoleListById($id);
        return view('backend.admin.role.role_edit', compact("editData"));
    }

    public function RoleEditStore(Request $request, $id)
    {
        $role = SysRole::find($id);
        $role->name = $request->name;
        $role->status = $request->status;
        $role->description = $request->description;
        $role->updated_at = Carbon::now();
        // $role->save();
        // DB::table('sys_role_module')->where('role_id', $id)->delete();
        // DB::table('sys_role_method')->where('role_id', $id)->delete();
        // $module = self::SysRoleModuleData($request->module, $id);
        // $method = self::SysRoleMethodData($request->method, $id);
        // if ($module) {
        //     self::saveArray('sys_role_module', $module);
        // }
        // if ($method) {
        //     self::saveArray('sys_role_method', $method);
        // }
        // $notification = array(
		// 	'message' => 'Role Create Successfully',
		// 	'alert-type' => 'success'
		// );
		// return redirect()->route('role.view')->with($notification);
    }

    private static function saveArray($table = null, $data = [])
    {
        return DB::table($table)->insert($data);
    }
    
    public function RoleDelete($id)
	{
		$sysRole = SysRole::find($id);
        $status = 0;
        if ($sysRole->status) { $status = 0; }
        else { $status = 1; }
		$sysRole->status = $status;
		$sysRole->save();
		$notification = array(
			'message' => 'Role disable Successfully',
			'alert-type' => 'info'
		);
		return redirect()->route('role.view')->with($notification);
	}
}
