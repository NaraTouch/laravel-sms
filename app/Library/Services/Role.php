<?php
namespace App\Library\Services;
use App\Models\SysRole;
use App\Models\SysModule;
  
class Role
{
    public static function AccessStore($user = false)
    {
        $role = SysRole::find($user->role_id);
        if (!isset($role)) {
            return [
                'menu' => [],
                'admin' => false,
                'permission' => []
            ];
        }
        if ($role->permission_type !== 'all') {
            $permissions = json_decode($role->permissions, true);
            return [
                'menu' => $permissions,
                'admin' => false,
                'permission' => self::Permission($permissions)
            ];
        }
        $modules = SysModule::select(['id','name', 'group', 'icon', 'prefix', 'position'])
            ->with(['methods' => function ($query) {
                $query
                    ->select(['id', 'sys_module_id', 'name', 'sys_name', 'is_menu', 'position'])
                    ->orderBy('position', 'asc');
            }])
            ->orderBy('position', 'asc')
            ->get()
            ->toArray();
            $url = [];

        return [
            'menu' => $modules,
            'admin' => true,
            'permission' => self::Permission($modules)
        ];
    }

    public static function Permission($modules = [])
    {
        $permission = [];
        if (!isset($modules)) {
            return $permission;
        }
        foreach ($modules as $key => $module) {
            if (!isset($module['methods'])) {
                continue;
            }
            foreach ($module['methods'] as $index => $method) {
                if (!isset($method['sys_name'])) {
                    continue;
                }
               array_push($permission, $method['sys_name']);
            }
        }
        return $permission;
    }

    public static function GetMenu($request)
    {
        return $request->session()->get('_session')['menu'];
    }

    public static function GetPermission($request)
    {
        return $request->session()->get('_session')['permission'];
    }

}