<?php
namespace App\Library\Services;
  
class Policy
{

    protected $adminOnly = [
        'method.add',
        'method.edit',
        'module.add',
        'module.edit'
    ];

    public function Authorization($request)
    {
        $_session = $request->session()->get('_session');
        $_permissions = $_session['permission'];
        if (!isset($_permissions)) {
            return false;
        }
        $route = $request->route();
        $actionName = $route->getActionName();
        $routeName = $request->route()->getName();
        $isPost = $request->isMethod('POST');
        if (!self::GetAdmin($request)) {
            return false;
        }
        if ($isPost) {
            if (strpos($routeName, "store") !== false) {
                $routeName = str_replace("store.","",$routeName).'.add';
            }
            if (strpos($routeName, "update") !== false) {
                $routeName = str_replace("update.","",$routeName).'.edit';
            }
        }
        if (in_array($routeName, $_permissions)) {
            return true;
        }
        return false;
    }

    public static function GetAdmin($request)
    {
        $routeName = $request->route()->getName();
        $admin = $request->session()->get('_session')['admin'];
        if (!$admin && in_array($routeName, $adminOnly)) {
            return false;
        }
        return true;
    }
}