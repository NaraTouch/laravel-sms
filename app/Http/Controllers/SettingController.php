<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\SysModule;
use App\Models\SysMethod;
use Carbon\Carbon;
use DB;

class SettingController extends Controller
{
    // Admin Login Controller
    public function ModuleView()
    {
        $allData = DB::table('sys_modules')
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
            ->orderBy('sys_modules.position')
            ->orderBy('sys_methods.position')
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
        return view("backend.admin.setting.module_view", compact("allData"));
    }

    public function ModuleAdd()
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

    public function ModuleEdit($id)
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
        $allData = SysMethod::where('module_id', $id)->get();
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
            "module_id" => $id,
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
