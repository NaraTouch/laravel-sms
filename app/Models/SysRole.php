<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use DB;

class SysRole extends Model
{
    use HasFactory;

    public static function RoleListById($id, $sort = false)
    {
        $query =  DB::table('sys_modules')
            ->select(
                'sys_modules.id as id',
                'sys_modules.name as name',
                'sys_modules.prefix as prefix',
                'sys_modules.position as sys_module_position',
                'sys_modules.icon as icon',
                'sys_modules.group as group',
                'sys_methods.id as method_id',
                'sys_methods.name as method_name',
                'sys_methods.position as sys_method_position',
                'sys_methods.sys_name as sys_name',
                'sys_methods.is_menu as is_menu',
                'sys_role_module.module_id as sys_role_module_id',
                'sys_role_module.role_id as sys_role_module_role_id',
                'sys_role_method.method_id as sys_role_method_id',
                'sys_role_method.role_id as sys_role_method_role_id'
            )
            ->leftJoin('sys_methods', 'sys_methods.module_id', '=', 'sys_modules.id')
            ->leftJoin('sys_role_module', 'sys_role_module.module_id', '=', 'sys_modules.id')
            ->leftJoin('sys_role_method', 'sys_role_method.method_id', '=', 'sys_methods.id')
            ->where('sys_role_module.role_id', '=', $id)
            ->where('sys_role_method.role_id', '=', $id);

        if ($sort) {
            $query->orderBy('sys_modules.position');
            $query->orderBy('sys_methods.position');
        }

        $queryResults = $query->get()
            ->groupBy('id')
            ->map(function ($item) use ($id) {
                $module = [
                    'id' => $item[0]->id,
                    'name' => $item[0]->name,
                    'prefix' => $item[0]->prefix,
                    'group' => $item[0]->group,
                    'sys_module_position' => $item[0]->sys_module_position,
                    'icon' => $item[0]->icon,
                    'sys_methods' => []
                ];

                if ($item[0]->sys_role_module_id !== null) {
                    $module['is_checked'] = 1;
                } else {
                    $module['is_checked'] = 0;
                }

                foreach ($item as $key => $method) {
                    $module['sys_methods'][$key] = [
                        'id' => $method->method_id,
                        'name' => $method->method_name,
                        'sys_method_position' => $method->sys_method_position,
                        'sys_name' => $method->sys_name,
                        'is_menu' => $method->is_menu,
                    ];

                    if ($method->sys_role_method_id !== null) {
                        $module['sys_methods'][$key]['is_checked'] = 1;
                    } else {
                        $module['sys_methods'][$key]['is_checked'] = 0;
                    } 
                }

                return $module;
            })
            ->values();

        if ($sort) {
            $queryResults = $queryResults->sortBy('group');
        }

        return $queryResults;
    }

    public static function RoleList()
    {
        $query = DB::table('sys_modules')
            ->select(
                'sys_modules.id as id',
                'sys_modules.name as name',
                'sys_modules.prefix as prefix',
                'sys_modules.position as sys_module_position',
                'sys_modules.icon as icon',
                'sys_modules.group as group',
                'sys_methods.id as method_id',
                'sys_methods.name as method_name',
                'sys_methods.position as sys_method_position',
            )
            ->leftJoin('sys_methods', 'sys_methods.module_id', '=', 'sys_modules.id')
            ->get()
            ->groupBy('id')
            ->map(function ($item) {
                $module = [
                    'id' => $item[0]->id,
                    'name' => $item[0]->name,
                    'prefix' => $item[0]->prefix,
                    'group' => $item[0]->group,
                    'sys_module_position' => $item[0]->sys_module_position,
                    'icon' => $item[0]->icon,
                    'sys_methods' => []
                ];
                foreach ($item as $method) {
                    if ($method->method_id !== null) {
                        $module['sys_methods'][] = [
                            'id' => $method->method_id,
                            'name' => $method->method_name,
                            'sys_method_position' => $method->sys_method_position
                        ];
                    }
                }
                return $module;
            })
            ->values();
        if ($query) {
            $query = $query->sortBy('group');
        }
        return $query;
    }
}
