<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Auth;
use App\Models\SysRole;
use App\Models\SysModule;
use App\Library\Services\Role;
use App\Library\Services\Policy;
use Carbon\Carbon;
use DB;

class RoleController extends Controller
{
    // Admin Login Controller

    public function RoleView(Request $request)
    {
        $allData = [];
        $creator = Auth::guard("admin")->user()->id;
        if (Policy::IsAdmin($request)) {
            $allData = SysRole::all();
        } else {
            $allData = SysRole::all()->where('creator', $creator);
        }
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
        $creator = Auth::guard("admin")->user()->id;
        SysRole::insertGetId([
            "name" => $request->name,
            "status" => $request->status,
            "permission_type" => 'custom',
            "creator" => $creator,
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

    private static function PermissionEdit($menus = [], $permissions = [])
    {
        $data = [];
        foreach ($menus as $key => $menu) {
            $_menu = $menu;
            $_menu_checked = false;
            if (isset($permissions)) {
                unset($_menu['methods']);
                $_methods = [];
                foreach ($menu['methods'] as $met => $method) {
                    $_method_checked = false;
                    foreach ($permissions as $index => $permission) {
                        if (isset($permission) && ($menu['id'] === $permission->id)) {
                            $_menu_checked = true;
                            if (!isset($permission->methods)) {
                                continue;
                            }
                            foreach ($permission->methods as $pmet => $pmethod) {
                                if (isset($pmethod) && ($method['id'] === $pmethod->id)) {
                                    $_method_checked = true;
                                }
                            }
                        }
                    }
                    $method['is_checked'] = $_method_checked;
                    $_methods[] = $method;
                }
                $_menu['methods'] = $_methods;
            }
            $_menu['is_checked'] = $_menu_checked;
            $data[$key] = $_menu;
        }
        return $data;
    }

    public function RoleEdit(Request $request, $id)
    {
        $editData = SysRole::find($id);
        $menu = Role::GetMenu($request);
        $editData['permission'] = self::PermissionEdit($menu, json_decode($editData->permissions));
        return view('backend.admin.role.role_edit', compact("editData"));
    }

    private static function PermissionUpdate($menus, $request)
    {
        $data = [];
        if (isset($request->module)) {
            foreach ($request->module as $mod => $module_id) {
                foreach ($menus as $key => $module) {
                    $_menu = $module;
                    unset($_menu['methods']);
                    if ($module['id'] != $module_id) {
                        continue;
                    }
                    if (isset($request->method)) {
                        foreach ($request->method as $mot => $method_id) {
                            foreach ($module['methods'] as $index => $method) {
                                if ($method['id'] != $method_id) {
                                    continue;
                                }
                                $_menu['methods'][$index] = $method;
                            }
                        }
                    }
                    $data[$key] = $_menu;
                }
            }
        }
        return $data;
    }

    public function RoleEditStore(Request $request, $id)
    {
        $role_id = Auth::guard("admin")->user()->role_id;
        if ($role_id == $id) {
            $notification = array(
                'message' => 'You cannot update your own role.',
                'alert-type' => 'error'
            );
            return redirect()->route('role.view')->with($notification);
        }
        $menus = Role::GetMenu($request);
        $permissions = self::PermissionUpdate($menus, $request);
        $role = SysRole::find($id);
        $role->name = $request->name;
        $role->status = $request->status;
        $role->permissions = json_encode($permissions);
        $role->description = $request->description;
        $role->updated_at = Carbon::now();
        $role->save();
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
