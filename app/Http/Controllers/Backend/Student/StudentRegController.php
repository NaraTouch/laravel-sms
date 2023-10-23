<?php

namespace App\Http\Controllers\Backend\Student;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\AssignStudent;
use App\Models\User;
use App\Models\DiscountStudent;
use App\Models\Academics;

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
		$data['allData'] = DB::table('assign_students')
            ->select(
                DB::raw('COUNT(assign_students.id) as id'),
                'assign_students.student_id as student_id',
                'users.id as user_id',
                'users.name as student_name',
                'users.id_no as student_id_no',
                'users.image as student_image'
            )
            ->join('users', 'users.id', '=', 'assign_students.student_id')
            ->groupBy('student_id')
            ->orderByRaw('COUNT(assign_students.id) DESC')
            ->get();
		return view('backend.admin.dashboard.student.student_reg.student_view', $data);
	}

	public function StudentClassYearWise(Request $request)
	{
		$data['student_id_no'] = $request->student_id_no;
		$data['name'] = $request->name;
		$data['allData'] = [];
		if (is_null($data['student_id_no']) && is_null($data['name'])) {
			return redirect()->route('student.registration.view');
		}
		$data['allData'] = DB::table('assign_students')
			->select(
				DB::raw('COUNT(assign_students.id) as id'),
				'assign_students.student_id as student_id',
				'users.id as user_id',
				'users.name as student_name',
				'users.id_no as student_id_no',
				'users.image as student_image'
			)
			->join('users', 'users.id', '=', 'assign_students.student_id')
			->when($request->student_id_no, function ($query) use ($request) {
				return $query->where('users.id_no', $request->student_id_no);
			})
			->when($request->name, function ($query) use ($data) {
				return $query->where('users.name', 'like', '%'.$data['name'].'%');
			})
			->groupBy('assign_students.student_id')
			->orderByRaw('COUNT(assign_students.id) DESC')
			->get();
		return view('backend.admin.dashboard.student.student_reg.student_view', $data);
	}

	public function StudentRegAdd()
	{
		$data['academics'] = Academics::all();
		return view('backend.admin.dashboard.student.student_reg.student_add', $data);
	}

	public function StudentRegStore(Request $request)
	{
		$academy = Academics::
					where('id', $request->academy_id)
					->where('status', 1)->first();
		DB::transaction(function () use ($request, $academy) {
			$checkYear = StudentYear::find($academy->year_id)->name;
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
			try {
				$user->save();
			} catch (\Illuminate\Database\QueryException $e) {
				$errorMessage = $e->errorInfo[2];
				$notification = array(
					'message' => $errorMessage,
					'alert-type' => 'error'
				);
				return redirect()->route('student.registration.add')->with($notification);
			}
			$assign_student = new AssignStudent();
			$assign_student->student_id = $user->id;
			$assign_student->student_id = $user->id;
			$assign_student->academy_id = $academy->id;
			$assign_student->class_id = $academy->class_id;
			$assign_student->group_id = $academy->group_id;
			$assign_student->shift_id = $academy->shift_id;
			$assign_student->save();

			$discount_student = new DiscountStudent();
			$discount_student->assign_student_id = $assign_student->id;
			$discount_student->fee_category_id = '1';
			$discount_student->discount = $request->discount;
			
			try {
				$discount_student->save();
			} catch (\Illuminate\Database\QueryException $e) {
				$errorMessage = $e->errorInfo[2];
				$notification = array(
					'message' => $errorMessage,
					'alert-type' => 'error'
				);
				return redirect()->route('student.registration.add')->with($notification);
			}
		});
		$notification = array(
			'message' => 'Student Registration Inserted Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('student.registration.view', 
			[
				'year_id' => $academy->year_id,
				'class_id' => $academy->class_id
			])->with($notification);
	}

	public function StudentRegEdit($student_id)
	{
		$data['academics'] = Academics::all();
		$data['editData'] = AssignStudent::with(['student', 'discount'])->where('student_id', $student_id)->first();
		return view('backend.admin.dashboard.student.student_reg.student_edit', $data);
	}

	public function StudentRegUpdate(Request $request, $student_id)
	{
		$academy = Academics::
					where('id', $request->academy_id)
					->where('status', 1)->first();
		DB::transaction(function () use ($request, $student_id, $academy) {
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
			$assign_student->academy_id = $academy->id;
			$assign_student->year_id = $academy->year_id;
			$assign_student->class_id = $academy->class_id;
			$assign_student->group_id = $academy->group_id;
			$assign_student->shift_id = $academy->shift_id;
			$assign_student->save();

			$discount_student = DiscountStudent::where('assign_student_id', $request->id)->first();
			$discount_student->discount = $request->discount;
			$discount_student->save();
		});
		$notification = array(
			'message' => 'Student Registration Updated Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('student.registration.view', 
			[
				'year_id' => $academy->year_id,
				'class_id' => $academy->class_id
			])->with($notification);
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
