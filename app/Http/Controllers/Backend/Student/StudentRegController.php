<?php

namespace App\Http\Controllers\Backend\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AssignStudent;
use App\Models\User;
use App\Models\DiscountStudent;
use App\Models\StudentYear;
use App\Models\StudentClass;
use App\Models\StudentGroup;
use App\Models\StudentShift;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use PDF;


class StudentRegController extends Controller
{
	public function StudentRegView()
	{
		$data['years'] = StudentYear::all();
		$data['classes'] = StudentClass::all();

		$latestYear = StudentYear::orderBy('id', 'desc')->first();
		$latestClass = StudentClass::orderBy('id', 'desc')->first();
		$data['allData'] = [];
		if ($latestYear && $latestClass) {
			$data['year_id'] = $latestYear->id;
			$data['class_id'] = $latestClass->id;
			$data['allData'] = AssignStudent::where('year_id', $data['year_id'])->where('class_id', $data['class_id'])->get();
		}
		return view('backend.admin.dashboard.student.student_reg.student_view', $data);
	}

	public function StudentClassYearWise(Request $request)
	{
		$data['years'] = StudentYear::all();
		$data['classes'] = StudentClass::all();

		$data['year_id'] = $request->year_id;
		$data['class_id'] = $request->class_id;
		$data['name'] = $request->name;
		$data['allData'] = [];
		if (!is_null($data['year_id']) ||
			!is_null($data['class_id']) ||
			!is_null($data['name'])
		) {
			$data['allData'] = DB::table('assign_students')
			->select(
				'assign_students.id as id',
				'assign_students.student_id as student_id',
				'users.id as user_id',
				'student_years.id as student_year_id',
				'student_classes.id as student_classe_id',
				'users.name as student_name',
				'users.id_no as student_id_no',
				'users.image as student_image',
				'student_years.name as student_year_name',
				'student_classes.name as student_classe_name'
				)
			->join('users', 'users.id', '=', 'assign_students.student_id')
			->join('student_years', 'student_years.id', '=', 'assign_students.year_id')
			->join('student_classes', 'student_classes.id', '=', 'assign_students.class_id')
			->when($request->year_id, function ($query) use ($request) {
				return $query->where('year_id', $request->year_id);
			})
			->when($request->class_id, function ($query) use ($request) {
				return $query->where('class_id', $request->class_id);
			})
			->when($request->name, function ($query) use ($data) {
				return $query->where('users.name', 'like', '%'.$data['name'].'%');
			})
			->get();
		}
		return view('backend.admin.dashboard.student.student_reg.student_view', $data);
	}

	public function StudentRegAdd()
	{
		$data['years'] = StudentYear::all();
		$data['classes'] = StudentClass::all();
		$data['groups'] = StudentGroup::all();
		$data['shifts'] = StudentShift::all();
		return view('backend.admin.dashboard.student.student_reg.student_add', $data);
	}

	public function StudentRegStore(Request $request)
	{
		DB::transaction(function () use ($request) {
			$checkYear = StudentYear::find($request->year_id)->name;
			$student = User::orderBy('id', 'DESC')->first();

			if ($student == null) {
				$firstReg = 0;
				$studentId = $firstReg + 1;
				if ($studentId < 10) {
					$id_no = '000' . $studentId;
				} elseif ($studentId < 100) {
					$id_no = '00' . $studentId;
				} elseif ($studentId < 1000) {
					$id_no = '0' . $studentId;
				}
			} else {
				$student = User::orderBy('id', 'DESC')->first()->id;
				$studentId = $student + 1;
				if ($studentId < 10) {
					$id_no = '000' . $studentId;
				} elseif ($studentId < 100) {
					$id_no = '00' . $studentId;
				} elseif ($studentId < 1000) {
					$id_no = '0' . $studentId;
				}
			}

			$final_id_no = $checkYear . $id_no;
			$user = new User();
			$user->id_no = $final_id_no;
			$user->password = Hash::make("123456789");
			$user->name = $request->name;
			$user->fname = $request->fname;
			$user->mname = $request->mname;
			$user->mobile = $request->mobile;
			$user->address = $request->address;
			$user->gender = $request->gender;
			$user->religion = $request->religion;
			$user->dob = date('Y-m-d', strtotime($request->dob));
			$user->email = $request->email;

			if ($request->file('image')) {
				$file = $request->file('image');
				$filename = date('YmdHi') . $file->getClientOriginalName();
				$file->move(public_path('upload/student_images'), $filename);
				$user['image'] = $filename;
			}
			$user->save();

			$assign_student = new AssignStudent();
			$assign_student->student_id = $user->id;
			$assign_student->year_id = $request->year_id;
			$assign_student->class_id = $request->class_id;
			$assign_student->group_id = $request->group_id;
			$assign_student->shift_id = $request->shift_id;
			$assign_student->save();

			$discount_student = new DiscountStudent();
			$discount_student->assign_student_id = $assign_student->id;
			$discount_student->fee_category_id = '1';
			$discount_student->discount = $request->discount;
			$discount_student->save();
		});

		$notification = array(
			'message' => 'Student Registration Inserted Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('student.registration.view')->with($notification);
	}

	public function StudentRegEdit($student_id)
	{
		$data['years'] = StudentYear::all();
		$data['classes'] = StudentClass::all();
		$data['groups'] = StudentGroup::all();
		$data['shifts'] = StudentShift::all();

		$data['editData'] = AssignStudent::with(['student', 'discount'])->where('student_id', $student_id)->first();
		return view('backend.admin.dashboard.student.student_reg.student_edit', $data);
	}

	public function StudentRegUpdate(Request $request, $student_id)
	{
		DB::transaction(function () use ($request, $student_id) {
			$user = User::where('id', $student_id)->first();
			$user->name = $request->name;
			$user->fname = $request->fname;
			$user->mname = $request->mname;
			$user->mobile = $request->mobile;
			$user->address = $request->address;
			$user->gender = $request->gender;
			$user->religion = $request->religion;
			$user->dob = date('Y-m-d', strtotime($request->dob));

			if ($request->file('image')) {
				$file = $request->file('image');
				@unlink(public_path('upload/student_images/' . $user->image));
				$filename = date('YmdHi') . $file->getClientOriginalName();
				$file->move(public_path('upload/student_images'), $filename);
				$user['image'] = $filename;
			}
			$user->save();

			$assign_student = AssignStudent::where('id', $request->id)->where('student_id', $student_id)->first();
			$assign_student->year_id = $request->year_id;
			$assign_student->class_id = $request->class_id;
			$assign_student->group_id = $request->group_id;
			$assign_student->shift_id = $request->shift_id;
			$assign_student->save();

			$discount_student = DiscountStudent::where('assign_student_id', $request->id)->first();
			$discount_student->discount = $request->discount;
			$discount_student->save();
		});
		$notification = array(
			'message' => 'Student Registration Updated Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('student.registration.view')->with($notification);
	}

	public function StudentRegPromotion($student_id)
	{
		$data['years'] = StudentYear::all();
		$data['classes'] = StudentClass::all();
		$data['groups'] = StudentGroup::all();
		$data['shifts'] = StudentShift::all();
		$data['editData'] = AssignStudent::with(['student', 'discount'])->where('student_id', $student_id)->first();
		return view('backend.admin.dashboard.student.student_reg.student_promotion', $data);
	}

	public function StudentUpdatePromotion(Request $request, $student_id)
	{
		DB::transaction(function () use ($request, $student_id) {
			$user = User::where('id', $student_id)->first();
			$user->name = $request->name;
			$user->fname = $request->fname;
			$user->mname = $request->mname;
			$user->mobile = $request->mobile;
			$user->address = $request->address;
			$user->gender = $request->gender;
			$user->roll = $request->roll;
			$user->religion = $request->religion;
			$user->dob = date('Y-m-d', strtotime($request->dob));

			if ($request->file('image')) {
				$file = $request->file('image');
				@unlink(public_path('upload/student_images/' . $user->image));
				$filename = date('YmdHi') . $file->getClientOriginalName();
				$file->move(public_path('upload/student_images'), $filename);
				$user['image'] = $filename;
			}
			$user->save();

			$assign_student = new AssignStudent();
			$assign_student->student_id = $student_id;
			$assign_student->year_id = $request->year_id;
			$assign_student->class_id = $request->class_id;
			$assign_student->group_id = $request->group_id;
			$assign_student->shift_id = $request->shift_id;
			$assign_student->save();

			$discount_student = new DiscountStudent();
			$discount_student->assign_student_id = $assign_student->id;
			$discount_student->fee_category_id = '1';
			$discount_student->discount = $request->discount;
			$discount_student->save();
		});
		$notification = array(
			'message' => 'Student Promotion Updated Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('student.registration.view')->with($notification);
	}

	public function StudentRegDetails($student_id)
	{
		$data['details'] = AssignStudent::with(['student', 'discount'])->where('student_id', $student_id)->first();

		$pdf = PDF::loadView('backend.admin.dashboard.student.student_reg.student_details_pdf', $data);
		$pdf->SetProtection(['copy', 'print'], '', 'pass');
		$pdfName = 'student-details-id-' . $student_id;
		return $pdf->stream($pdfName);
	}
}
