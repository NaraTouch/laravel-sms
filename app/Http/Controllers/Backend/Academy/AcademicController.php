<?php

namespace App\Http\Controllers\Backend\Academy;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Academics;

class AcademicController extends Controller
{
    public function AcademicView()
	{
		$data['allData'] = Academics::all();
		return view('backend.admin.dashboard.academic.academic_view', $data);
	}
}
