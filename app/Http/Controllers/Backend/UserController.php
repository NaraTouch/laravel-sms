<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;
use App\Models\User;
use App\Models\Admin;
use App\Models\Moderator;

class UserController extends Controller
{
    public function UserView()
    {
        $userData = User::all();
        return view("backend.admin.dashboard.user.admin_user_view", compact("userData"));
    }
    public function UserAdd()
    {
        return view("backend.admin.dashboard.user.admin_user_add");
    }
    public function UserAddStore(Request $request)
    {
        if ($request->role == "User") {
            $validatedData = $request->validate([
                "email" => "required|unique:users",
                "name" => "required",
            ]);
            $data = new User();
            $data->name = $request->name;
            $data->email = $request->email;
            $data->password = Hash::make("123456789"); // 123456789
            $data->status = 1;
            $data->email_verified_at = Carbon::now();
            $data->created_at = Carbon::now();
            $data->save();

            $notification = array(
                'message' => "User inserted successfully",
                'alert-type' => 'success'
            );

            return redirect()->route("user.view")->with($notification);
        } else if ($request->role == "Admin") {
            $validatedData = $request->validate([
                "email" => "required|unique:admins",
                "name" => "required",
            ]);
            $data = new Admin();
            $data->name = $request->name;
            $data->email = $request->email;
            $data->password = Hash::make("123456789"); // 123456789
            $data->status = 1;
            $data->secret_code = $request->secret_code;
            $data->email_verified_at = Carbon::now();
            $data->created_at = Carbon::now();
            $data->save();

            $notification = array(
                'message' => "User inserted successfully",
                'alert-type' => 'success'
            );

            return redirect()->route("user.view")->with($notification);
        } else if ($request->role == "Moderator") {
            $validatedData = $request->validate([
                "email" => "required|unique:moderators",
                "name" => "required",
            ]);
            $data = new Moderator();
            $data->name = $request->name;
            $data->email = $request->email;
            $data->password = Hash::make("123456789"); // 123456789
            $data->status = 1;
            $data->email_verified_at = Carbon::now();
            $data->created_at = Carbon::now();
            $data->save();

            $notification = array(
                'message' => "User inserted successfully",
                'alert-type' => 'success'
            );

            return redirect()->route("user.view")->with($notification);
        }
    }

    public function UserEdit($id)
    {
        $editData = User::find($id);
        return view('backend.admin.dashboard.user.admin_user_edit', compact('editData'));
    }
    public function UserEditStore(Request $request, $id)
    {
        $data = User::find($id);
        $data->name = $request->name;
        $data->email = $request->email;
        $data->updated_at = Carbon::now();
        $data->save();

        $notification = array(
            'message' => "User data updated successfully",
            'alert-type' => 'info'
        );

        return redirect()->route("user.view")->with($notification);
    }

    public function UserDelete($id)
    {
        $user = User::find($id);
        $user->delete();

        $notification = array(
            'message' => "User deleted successfully",
            'alert-type' => 'success'
        );

        return redirect()->route("user.view")->with($notification);
    }
}
