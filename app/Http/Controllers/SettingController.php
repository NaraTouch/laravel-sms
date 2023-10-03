<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\SysModule;
use App\Models\SysMethod;
use App\Library\Services\Role;
use Carbon\Carbon;
use DB;

class SettingController extends Controller
{
    
    // Admin Login Controller
    public function ModuleView(Request $request)
    {
        $allData = Role::GetMenu($request);
        return view("backend.admin.setting.module_view", compact("allData"));
    }

    public function ModuleAdd(Request $request)
    {
        return view('backend.admin.setting.module_add', []);
    }
    
    public function ModuleAddStore(Request $request)
    {
        SysModule::insert([
            "name" => $request->name,
            "prefix" => $request->prefix,
            "group" => $request->group,
            "position" => $request->position,
            "icon" => $request->icon,
            "description" => $request->description,
            "created_at" => Carbon::now(),
            "updated_at" => Carbon::now(),
        ]);

        $notification = array(
			'message' => 'Module Create Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('module.view')->with($notification);
    }

    public function ModuleEdit(Request $request, $id)
	{
		$data['editData'] = SysModule::find($id);
		return view('backend.admin.setting.module_edit', $data);
	}

    public function ModuleEditStore(Request $request, $id)
	{
		$sysModule = SysModule::find($id);
        $sysModule->name = $request->name;
        $sysModule->prefix = $request->prefix;
		$sysModule->group = $request->group;
        $sysModule->position = $request->position;
        $sysModule->icon = $request->icon;
		$sysModule->description = $request->description;
        $sysModule->updated_at = Carbon::now();
        $sysModule->save();

		$notification = array(
			'message' => 'Module Create Updated Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('module.view')->with($notification);
    }

    public function MethodView($id)
    {
        $allData = SysMethod::where('sys_module_id', $id)->get();
        return view("backend.admin.setting.method_view", compact("allData"));
    }

    public function MethodAdd($id)
    {
        $data['addData'] = SysModule::find($id);
		return view('backend.admin.setting.method_add', $data);
    }

    public function MethodAddStore(Request $request, $id)
    {
        SysMethod::insert([
            "name" => $request->name,
            "sys_module_id" => $id,
            "is_menu" => $request->is_menu,
            "sys_name" => $request->sys_name,
            "position" => $request->position,
            "description" => $request->description,
            "created_at" => Carbon::now(),
            "updated_at" => Carbon::now(),
        ]);

        $notification = array(
			'message' => 'Method Create Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('module.view')->with($notification);
    }

    public function MethodEdit($id)
	{
		$data['editData'] = SysMethod::find($id);
		return view('backend.admin.setting.method_edit', $data);
	}

    public function MethodEditStore(Request $request, $id)
    {
        $sysMethod = SysMethod::find($id);
        $sysMethod->name = $request->name;
		$sysMethod->sys_name = $request->sys_name;
		$sysMethod->is_menu = $request->is_menu;
        $sysMethod->position = $request->position;
        $sysMethod->description = $request->description;
        $sysMethod->updated_at = Carbon::now();
        $sysMethod->save();

		$notification = array(
			'message' => 'Module Create Updated Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('method.view', ['id' => $sysMethod->module_id])->with($notification);
    }
}
