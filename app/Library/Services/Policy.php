<?php
namespace App\Library\Services;
  
class Policy
{

    public static function getAdminOnly()
    {
        return [
            'method.add',
            'method.edit',
            'module.add',
            'module.edit'
        ];
    }

    public function Authorization($request)
    {
        $_session = $request->session()->get('_session');
        $_permissions = $_session['permission'];
        if (!isset($_permissions)) {
            return false;
        }
        $route = $request->route();
        $actionName = $route->getActionName();
        $routeName = $route->getName();
        $isPost = $request->isMethod('POST');
        
        if (!self::OnlyAdmin($request)) {
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

    public static function OnlyAdmin($request)
    {
        $routeName = $request->route()->getName();
        $admin = $request->session()->get('_session')['admin'];
        if (!$admin && in_array($routeName, self::getAdminOnly())) {
            return false;
        }
        return true;
    }
    
    public static function IsAdmin($request)
    {
        $_session = $request->session()->get('_session');
        return $_session['admin'];
    }
}