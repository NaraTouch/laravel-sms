<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Models\SysRole;
use App\Models\SysModule;
use App\Library\Services\Role;
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

    public function RoleAdd(Request $request)
    {
        $allData = Role::GetMenu($request);
        return view('backend.admin.role.role_add', compact("allData"));
    }

    private static function PermissionData($role, $data)
    {
        $permissions = [];
        foreach ($data as $module_id => $method) {
            foreach ($role as $index => $value) {
                if ($value['id'] != $module_id) {
                    continue;
                }
                $module = $value;
                unset($module['methods']);
                $permissions[$index] = $module;
                foreach ($method as $x => $method_id) {
                    foreach ($value['methods'] as $k => $v) {
                        if ($v['id'] != $method_id) {
                            continue;
                        }
                        $permissions[$index]['methods'][$k] = $v;
                    }
                }
            }
        }
        return $permissions;
    }

    public function RoleAddStore(Request $request)
    {
        $permissions = [];
        $permission_type = 'custom';
        $role = Role::GetMenu($request);
        if (isset($request->permission)) {
            $permissions = self::PermissionData($role, $request->permission);
        }
        SysRole::insertGetId([
            "name" => $request->name,
            "status" => $request->status,
            "permission_type" => 'custom',
            "permissions" => json_encode($permissions),
            "description" => $request->description,
            "created_at" => Carbon::now(),
            "updated_at" => Carbon::now(),
        ]);
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
        $role_id = Auth::guard("admin")->user()->role_id;
        $editData = SysRole::find($id);
        $permission_type = $editData->permission_type;
        $permissions = $editData->permissions;
        $creator = $editData->creator;
        $editData['permission'] = [];
        
        if ($permission_type === 'all') {
            $modules = SysModule::with('methods')->get();
            dump(json_encode($modules));
        } else {
            
        }
        
        // $editData['permission'] = SysRole::RoleListEdit($id, $role_id);
        return view('backend.admin.role.role_edit', compact("editData"));
    }

    public function RoleEditStore(Request $request, $id)
    {
        $role = SysRole::find($id);
        $role->name = $request->name;
        $role->status = $request->status;
        $role->description = $request->description;
        $role->updated_at = Carbon::now();
        $role->save();
        DB::table('sys_role_module')->where('role_id', $id)->delete();
        DB::table('sys_role_method')->where('role_id', $id)->delete();
        $module = self::SysRoleModuleData($request->module, $id);
        $method = self::SysRoleMethodData($request->method, $id);
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
