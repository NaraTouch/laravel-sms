<?php

namespace App\Http\Controllers\Backend\Setup;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\SchoolSubject;
use App\Models\StudentClass;
use App\Models\AssignSubject;
use Illuminate\Support\Facades\Validator;

class AssignSubjectController extends Controller
{
	public function ViewAssignSubject()
	{
		$data['allData'] = AssignSubject::select('class_id')->groupBy('class_id')->get();
		return view('backend.admin.dashboard.setup.assign_subject.view_assign_subject', $data);
	}

	public function AddAssignSubject()
	{
		$data['subjects'] = SchoolSubject::all();
		$data['classes'] = StudentClass::all();
		return view('backend.admin.dashboard.setup.assign_subject.add_assign_subject', $data);
	}

	private function ValidateAssignSubject($request)
    {
        $validator = Validator::make($request->all(),
            [
                'class_id' => 'required|integer',
                'subject_id' => 'required|array',
                'full_mark' => [
                    'required',
                    'array',
                    function ($attribute, $array, $fail) use ($request){
						foreach ($array as $index => $value) {
							if (!is_numeric($value)) {
								$fail('Invalid value.');
								break;
							}
						}
                    }
                ],
                'pass_mark' => [
                    'required',
                    'array',
                    function ($attribute, $array, $fail) use ($request){
						foreach ($array as $index => $value) {
							if (!is_numeric($value)) {
								$fail('Invalid value.');
								break;
							}
						}
                    }
                ],
				'subjective_mark' => [
                    'required',
                    'array',
                    function ($attribute, $array, $fail) use ($request){
						foreach ($array as $index => $value) {
							if (!is_numeric($value)) {
								$fail('Invalid value.');
								break;
							}
							if ($value > $request['full_mark'][$index]) {
								$fail('Subjective mark must lower than full mark.');
								break;
							}
						}
                    }
                ],
            ],
            [
                'class_id.required' => 'Required',
                'subject_id.required' => 'Required',
                'full_mark.required' => 'Required',
                'pass_mark.required' => 'Required',
                'subjective_mark.required' => 'Required',
            ]
        );
        return $validator;
    }

	public function StoreAssignSubject(Request $request)
	{
		$validator = $this->ValidateAssignSubject($request);
        if ($validator->fails()) {
			$error = $validator->errors()->first();
			$notification = array(
				'message' => $error,
				'alert-type' => 'error'
			);
			return redirect()->route('assign.subject.view')->with($notification);
		}
		$subjectCount = count($request->subject_id);
		if ($subjectCount != NULL) {
			for ($i = 0; $i < $subjectCount; $i++) {
				$assign_subject = new AssignSubject();
				$assign_subject->class_id = $request->class_id;
				$assign_subject->subject_id = $request->subject_id[$i];
				$assign_subject->full_mark = $request->full_mark[$i];
				$assign_subject->pass_mark = $request->pass_mark[$i];
				$assign_subject->subjective_mark = $request->subjective_mark[$i];
				$assign_subject->save();
			}
		}
		$notification = array(
			'message' => 'Subject Assign Inserted Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('assign.subject.view')->with($notification);
	}

	public function EditAssignSubject($class_id)
	{
		$data['editData'] = AssignSubject::where('class_id', $class_id)->orderBy('subject_id', 'asc')->get();
		$data['subjects'] = SchoolSubject::all();
		$data['classes'] = StudentClass::all();
		return view('backend.admin.dashboard.setup.assign_subject.edit_assign_subject', $data);
	}

	public function UpdateAssignSubject(Request $request, $class_id)
	{
		if ($request->subject_id == NULL) {
			$notification = array(
				'message' => 'Sorry You do not select any Subject',
				'alert-type' => 'error'
			);
			return redirect()->route('assign.subject.edit', $class_id)->with($notification);
		} else {
			$countClass = count($request->subject_id);
			AssignSubject::where('class_id', $class_id)->delete();
			for ($i = 0; $i < $countClass; $i++) {
				$assign_subject = new AssignSubject();
				$assign_subject->class_id = $request->class_id;
				$assign_subject->subject_id = $request->subject_id[$i];
				$assign_subject->full_mark = $request->full_mark[$i];
				$assign_subject->pass_mark = $request->pass_mark[$i];
				$assign_subject->subjective_mark = $request->subjective_mark[$i];
				$assign_subject->save();
			}
		}
		$notification = array(
			'message' => 'Data Updated Successfully',
			'alert-type' => 'success'
		);
		return redirect()->route('assign.subject.view')->with($notification);
	}

	public function DetailsAssignSubject($class_id)
	{
		$data['detailsData'] = AssignSubject::where('class_id', $class_id)->orderBy('subject_id', 'asc')->get();
		return view('backend.admin.dashboard.setup.assign_subject.details_assign_subject', $data);
	}
}
