<?php

namespace App\Http\Controllers\Backend\Academy;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Carbon\Carbon;
use App\Models\Academics;
use App\Models\StudentClass;
use DB;

class AcademicController extends Controller
{
    public function AcademicView()
	{

		$allData = DB::table('academics')
			->select('academics.*', 'student_classes.name as student_class_name')
            ->leftJoin('student_classes', 'academics.class_id', '=', 'student_classes.id')
			->get();
		return view('backend.admin.dashboard.academic.academic_view',  compact("allData"));
	}

	public function AcademicAdd()
	{
		$data['classes'] = StudentClass::all();
		return view('backend.admin.dashboard.academic.academic_add', $data);
	}

	public function AcademicStore(Request $request)
	{
		$data = new Academics();
		$data->class_id = $request->class_id;
		$data->name = $request->name;
		$data->start_date = $request->start_date;
		$data->end_date = $request->end_date;
		$data->status = $request->status;
		$data->created_at = Carbon::now();
		$data->updated_at = Carbon::now();
		$data->save();

		$notification = array(
			'message' => "Academy Created successfully",
			'alert-type' => 'success'
		);
		return redirect()->route("academic.view")->with($notification);
	}

	public function AcademicEdit($id)
	{
		$data['classes'] = StudentClass::all();
		$data['editData'] = Academics::where('id', $id)->first();
		return view('backend.admin.dashboard.academic.academic_edit', $data);
	}

	public function AcademicUpdate(Request $request, $id)
	{
		$academic = Academics::find($id);
		$academic->class_id = $request->class_id;
		$academic->name = $request->name;
		$academic->start_date = $request->start_date;
		$academic->end_date = $request->end_date;
		$academic->status = $request->status;
		$academic->updated_at = Carbon::now();
		$academic->save();

		$notification = array(
			'message' => "Academy Update successfully",
			'alert-type' => 'success'
		);
		return redirect()->route("academic.view")->with($notification);
	}

	public function AcademicDelete($id, $status)
	{
		$academic = Academics::find($id);
		$academic->status = $status;
		$academic->save();
		$notification = array(
			'message' => 'Academy Status Update Successfully',
			'alert-type' => 'info'
		);
		return redirect()->route('academic.view')->with($notification);
	}
}
