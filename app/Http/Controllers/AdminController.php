<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;
use App\Models\Admin;
use App\Models\SysRole;
use Illuminate\Support\Facades\Auth;
use App\Library\Services\Role;
use App\Library\Services\Policy;
use DB;

class AdminController extends Controller
{
    // Admin Login Controller
    public function AdminLogin()
    {
        return view("backend.admin.auth.admin_login");
    }

    public function AdminMemberView()
    {
        $allData = Admin::all();
        return view("backend.admin.dashboard.admin.admin_member_view", compact("allData"));
    }

	// public function AdminRegister()
    // {
    //     return view("backend.admin.auth.admin_register");
    // }

	public function AdminMemberDelete($id)
	{
		$admin = Admin::find($id);
		$admin->status = 0;
		$admin->save();
		$notification = array(
			'message' => 'Admin disable Successfully',
			'alert-type' => 'info'
		);
		return redirect()->route('admin.member.view')->with($notification);
	}

	public function AdminMemberAdd(Request $request)
	{
		$data['Role'] = [];
		if (Policy::GetAdmin($request)) {
			$data['Role'] = SysRole::all();
		}
		return view('backend.admin.dashboard.admin.admin_member_add', $data);
	}

	public function AdminMemberAddStore(Request $request)
    {
		if (!$request->password || !$request->confirm_password){
			$notification = array(
				'message' => 'password and Confirm password cannot empty.',
				'alert-type' => 'error'
			);
			return redirect()->route('admin.member.add')->with($notification);
		}
		if ($request->password != $request->confirm_password){
			$notification = array(
				'message' => 'password and Confirm password is not match.',
				'alert-type' => 'error'
			);
			return redirect()->route('admin.member.add')->with($notification);
		}
        Admin::insert([
            "name" => $request->name,
            "email" => $request->email,
			"mobile" => $request->mobile,
			"gender" => $request->gender,
			"address" => $request->address,
			"religion" => $request->religion,
			"dob" => $request->dob,
            "password" => Hash::make($request->password),
            "secret_code" => $request->secret_code,
            "created_at" => Carbon::now(),
			"role_id" => $request->role_id,
        ]);

        $notification = array(
			'message' => 'Admin Registration Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('admin.member.view')->with($notification);
    }

    public function AdminMemberEdit(Request $request, $id)
	{
		$data['editData'] = Admin::find($id);
		if (Policy::GetAdmin($request)) {
			$data['editData']['Role'] = SysRole::all();
		}
		// $data['designation'] = Designation::all();
		return view('backend.admin.dashboard.admin.admin_member_edit', $data);
	}
    
    public function AdminMemberEditStore(Request $request, $id)
	{
		$admin = Admin::find($id);
		$admin->name = $request->name;
		$admin->fname = $request->fname;
		$admin->mname = $request->mname;
		$admin->mobile = $request->mobile;
		$admin->address = $request->address;
		$admin->gender = $request->gender;
		$admin->religion = $request->religion;
		$admin->role_id = $request->role_id;

		$admin->designation_id = $request->designation_id;
		$admin->dob = date('Y-m-d', strtotime($request->dob));

		if ($request->current_password) {
			$check_hash = Hash::check($request->current_password, $admin->password);
			if (!$check_hash) {
				$notification = array(
					'message' => 'Current password is not match.',
					'alert-type' => 'error'
				);
				return redirect()->route('admin.member.edit', ['id' => $id])->with($notification);
			}
			if (!$request->new_password || !$request->confirm_password){
				$notification = array(
					'message' => 'New password and Confirm password cannot empty.',
					'alert-type' => 'error'
				);
				return redirect()->route('admin.member.edit', ['id' => $id])->with($notification);
			}
			if ($request->new_password != $request->confirm_password){
				$notification = array(
					'message' => 'New password and Confirm password is not match.',
					'alert-type' => 'error'
				);
				return redirect()->route('admin.member.edit', ['id' => $id])->with($notification);
			}
			$admin->password = Hash::make($request->new_password);
		}
		if ($request->file('image')) {
			$file = $request->file('image');
			@unlink(public_path('upload/admin_images/' . $admin->image));
			$filename = date('YmdHi') . $file->getClientOriginalName();
			$file->move(public_path('upload/admin_images'), $filename);
			$admin['image'] = $filename;
		}
		$admin->save();

		$notification = array(
			'message' => 'Admin Registration Updated Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('admin.member.view')->with($notification);
	}

    public function AdminLoginStore(Request $request)
    {
        $check = $request->all();

        $notificationSuccess = array(
            'message' => "Admin Login Successfully",
            'alert-type' => 'success'
        );

        if (Auth::guard("admin")->attempt(["email" => $check["email"], "password" => $check["password"], "secret_code" => $check["secret_code"]])) {
			$user = Auth::guard("admin")->user();
			$role = Role::AccessStore($user);
			$request->session()->put('_session', $role);
			return redirect()->route("admin.dashboard")->with($notificationSuccess);
        } else {
            return back()->with("alert", "Email, Password or Secret Code is invalid.");
        }

        if (!(Auth::guard("admin")->attempt(["email" => $check["email"]]))) {
            return back()->with("alert", "Email doesn't exists on our database.");
        } else {
            return back()->with("alert", "Email or Password is invalid.");
        }
    }

    public function AdminLogout(Request $request)
    {
        Auth::guard("admin")->logout();
		$request->session()->forget('_session');
        return redirect()->route("admin.login")->with("alert", "Admin Logout successfully.");
    }

    // public function AdminRegisterStore(Request $request)
    // {
    //     Admin::insert([
    //         "name" => $request->name,
    //         "email" => $request->email,
    //         "password" => Hash::make($request->password),
    //         "secret_code" => "Test",
    //         "created_at" => Carbon::now(),
    //     ]);

    //     return redirect()->route("admin.login")->with("alert", "Admin Created Successfully");
    // }
    // End Admin Login Controller


    // Admin Dashboard Controller
    public function AdminDashboard()
    {
        return view("backend.admin.dashboard.index");
    }

    // End Admin Dashboard Controller
}
