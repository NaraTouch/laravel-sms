<?php
namespace App\Library\Services;
  
class Policy
{
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
}