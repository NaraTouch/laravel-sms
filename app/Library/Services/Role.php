<?php
namespace App\Library\Services;
use App\Models\SysRole;
  
class Role
{
    public function AccessStore($user)
    {
        $roleListById = self::RoleListById($user->role_id);
        $session_data = [
            'name' => $user->name,
            'role_id' => $user->role_id,
            'profile_photo_path' => $user->profile_photo_path,
            'menu' => $roleListById['menu'],
            'permission' => $roleListById['permission']
        ];
        return $session_data;
    }

    private static function RoleListById($id)
    {
        $url = [];
        $roleListById = SysRole::RoleListById($id, 'sort');
        if ($roleListById) {
            $roleListById = $roleListById->sortBy('group');
            foreach ($roleListById as $key => $value) {
                if ($value['is_checked'] !== 1 || !isset($value['sys_methods'])){ 
                    continue;
                }
                foreach ($value['sys_methods'] as $k => $v) {
                    if ($v['is_checked'] !== 1) {
                        continue;
                    }
                    array_push($url, $v['sys_name']);
                }
            }
        }
        return [
            'menu' => $roleListById,
            'permission' => $url
        ];
    }
}