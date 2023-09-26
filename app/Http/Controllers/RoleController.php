<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
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
        $allData = DB::table('sys_modules')
            ->select(
                'sys_modules.id as id',
                'sys_modules.name as name',
                'sys_modules.group as group',
                'sys_methods.id as method_id',
                'sys_methods.name as method_name'
            )
            ->leftJoin('sys_methods', 'sys_methods.module_id', '=', 'sys_modules.id')
            ->get()
            ->groupBy('id')
            ->map(function ($item) {
                $module = [
                    'id' => $item[0]->id,
                    'name' => $item[0]->name,
                    'group' => $item[0]->group,
                    'sys_methods' => []
                ];
                foreach ($item as $method) {
                    if ($method->method_id !== null) {
                        $module['sys_methods'][] = [
                            'id' => $method->method_id,
                            'name' => $method->method_name
                        ];
                    }
                }
                return $module;
            })
            ->values();
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
		return redirect()->route('role_view')->with($notification);
    }

    private static function saveArray($table = null, $data = [])
    {
        return DB::table($table)->insert($data);
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
        $allData = DB::table('sys_modules')
            ->select(
                'sys_modules.id as id',
                'sys_modules.name as name',
                'sys_modules.group as group',
                'sys_methods.id as method_id',
                'sys_methods.name as method_name',
                'sys_role_module.module_id as sys_role_module_id',
                'sys_role_method.method_id as sys_role_method_id'
            )
            ->leftJoin('sys_methods', 'sys_methods.module_id', '=', 'sys_modules.id')
            ->leftJoin('sys_role_module', 'sys_role_module.module_id', '=', 'sys_modules.id')
            ->leftJoin('sys_role_method', 'sys_role_method.method_id', '=', 'sys_methods.id')
            ->where('sys_role_module.role_id', '=', $id)
            ->where('sys_role_method.role_id', '=', $id)
            ->get()
            ->groupBy('id')
            ->map(function ($item) {
                dump($item);
                $module = [
                    'id' => $item[0]->id,
                    'name' => $item[0]->name,
                    'group' => $item[0]->group,
                    'sys_methods' => []
                ];
                foreach ($item as $method) {
                    if ($method->method_id !== null) {
                        $module['sys_methods'][] = [
                            'id' => $method->method_id,
                            'name' => $method->method_name
                        ];
                    }
                }
                return $module;
            })
            ->values();
        dump($allData);die();
        return view('backend.admin.role.role_edit', compact("allData"));
    }

    public function RoleUpdate($id)
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
		return redirect()->route('role_view')->with($notification);
	}
}
