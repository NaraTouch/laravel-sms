<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\SettingController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\ModeratorController;
use App\Http\Controllers\Backend\UserController;
use App\Http\Controllers\Backend\AdminProfileController;

use App\Http\Controllers\Backend\Setup\StudentClassController;
use App\Http\Controllers\Backend\Setup\StudentYearController;
use App\Http\Controllers\Backend\Setup\StudentGroupController;
use App\Http\Controllers\Backend\Setup\StudentShiftController;
use App\Http\Controllers\Backend\Setup\FeeCategoryController;
use App\Http\Controllers\Backend\Setup\FeeAmountController;
use App\Http\Controllers\Backend\Setup\ExamTypeController;
use App\Http\Controllers\Backend\Setup\SchoolSubjectController;
use App\Http\Controllers\Backend\Setup\AssignSubjectController;
use App\Http\Controllers\Backend\Setup\DesignationController;

use App\Http\Controllers\Backend\Student\StudentRegController;
use App\Http\Controllers\Backend\Student\StudentRollController;
use App\Http\Controllers\Backend\Student\RegistrationFeeController;
use App\Http\Controllers\Backend\Student\MonthlyFeeController;
use App\Http\Controllers\Backend\Student\ExamFeeController;

use App\Http\Controllers\Backend\Employee\EmployeeRegController;
use App\Http\Controllers\Backend\Employee\EmployeeSalaryController;
use App\Http\Controllers\Backend\Employee\EmployeeLeaveController;
use App\Http\Controllers\Backend\Employee\EmployeeAttendanceController;
use App\Http\Controllers\Backend\Employee\MonthlySalaryController;

use App\Http\Controllers\Backend\Marks\MarksController;
use App\Http\Controllers\Backend\Marks\GradeController;

use App\Http\Controllers\Backend\DefaultController;

use App\Http\Controllers\Backend\Account\StudentFeeController;
use App\Http\Controllers\Backend\Account\AccountSalaryController;
use App\Http\Controllers\Backend\Account\OtherCostController;
use App\Http\Controllers\Backend\Academy\AcademicController;

use App\Http\Controllers\Backend\Report\ProfitController;
use App\Http\Controllers\Backend\Report\MarkSheetController;
use App\Http\Controllers\Backend\Report\AttendReportController;
use App\Http\Controllers\Backend\Report\ResultReportController;



/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the 'web' middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__ . '/auth.php';

// Admin routes
Route::prefix('admin')->group(function () {
    // Auth
    Route::get('login', [AdminController::class, 'AdminLogin'])->name('admin.login');
    Route::post('login', [AdminController::class, 'AdminLoginStore'])->name('store.admin.login');
    Route::get('logout', [AdminController::class, 'AdminLogout'])->name('admin.logout')->middleware('admin');
    // Route::get('register', [AdminController::class, 'AdminRegister'])->name('admin_register');
    // Route::post('register', [AdminController::class, 'AdminRegisterStore'])->name('admin_register_store');

    // Dashboard
    Route::get('/dashboard', [AdminController::class, 'AdminDashboard'])->name('admin.dashboard')->middleware('admin');

    // Admin Management
    Route::middleware(['admin'])->prefix('members')->group(function () {
        Route::get('view', [AdminController::class, 'AdminMemberView'])->name('admin.member.view');
        Route::get('add', [AdminController::class, 'AdminMemberAdd'])->name('admin.member.add');
        Route::post('add', [AdminController::class, 'AdminMemberAddStore'])->name('store.admin.member');
        Route::get('edit/{id}', [AdminController::class, 'AdminMemberEdit'])->name('admin.member.edit');
        Route::post('edit/{id}', [AdminController::class, 'AdminMemberEditStore'])->name('update.admin.member');
        Route::get('delete/{id}', [AdminController::class, 'AdminMemberDelete'])->name('admin.member.delete');
    });

    // App Setting Management
    Route::middleware(['admin'])->prefix('setting')->group(function () {
        Route::get('view', [SettingController::class, 'ModuleView'])->name('module.view');
        Route::get('add', [SettingController::class, 'ModuleAdd'])->name('module.add');
        Route::post('add', [SettingController::class, 'ModuleAddStore'])->name('store.module');//
        Route::get('edit/{id}', [SettingController::class, 'ModuleEdit'])->name('module.edit');
        Route::post('edit/{id}', [SettingController::class, 'ModuleEditStore'])->name('update.module');//
        Route::get('method/view/{id}', [SettingController::class, 'MethodView'])->name('method.view');
        Route::get('method/add/{id}', [SettingController::class, 'MethodAdd'])->name('method.add');
        Route::post('method/add/{id}', [SettingController::class, 'MethodAddStore'])->name('store.method');
        Route::get('method/edit/{id}', [SettingController::class, 'MethodEdit'])->name('method.edit');
        Route::post('method/edit/{id}', [SettingController::class, 'MethodEditStore'])->name('update.method');
    });

    // App Role Management
    Route::middleware(['admin'])->prefix('role')->group(function () {
        Route::get('view', [RoleController::class, 'RoleView'])->name('role.view');
        Route::get('add', [RoleController::class, 'RoleAdd'])->name('role.add');
        Route::post('add', [RoleController::class, 'RoleAddStore'])->name('store.role');
        Route::get('edit/{id}', [RoleController::class, 'RoleEdit'])->name('role.edit');
        Route::post('edit/{id}', [RoleController::class, 'RoleEditStore'])->name('update.role');
        Route::get('update/{id}', [RoleController::class, 'RoleDelete'])->name('role.delete');
    });

    // User Management
    Route::middleware(['admin'])->prefix('users')->group(function () {
        Route::get('view', [UserController::class, 'UserView'])->name('user.view');
        Route::get('add', [UserController::class, 'UserAdd'])->name('user.add');
        Route::post('add', [UserController::class, 'UserAddStore'])->name('store.user');
        Route::get('edit/{id}', [UserController::class, 'UserEdit'])->name('user.edit');
        Route::post('edit/{id}', [UserController::class, 'UserEditStore'])->name('update.user');
        Route::get('delete/{id}', [UserController::class, 'UserDelete'])->name('delete.user');
    });

    Route::middleware(['admin'])->prefix('profile')->group(function () {
        // Profile
        Route::get('view', [AdminProfileController::class, 'AdminProfileView'])->name('profile.view');
        Route::get('edit', [AdminProfileController::class, 'AdminProfileEdit'])->name('profile.user.add');
        Route::post('edit', [AdminProfileController::class, 'AdminProfileEditStore'])->name('store.user.profile');

        Route::get('change-password', [AdminProfileController::class, 'AdminPasswordView'])->name('password.view');
        Route::post('change-password', [AdminProfileController::class, 'AdminPasswordUpdate'])->name('update.password');
    });

    Route::middleware(['admin'])->prefix('setups')->group(function () {
        // Student Class Routes
        Route::get('student/class/view', [StudentClassController::class, 'ViewStudent'])->name('student.class.view');
        Route::get('student/class/add', [StudentClassController::class, 'StudentClassAdd'])->name('student.class.add');
        Route::post('student/class/store', [StudentClassController::class, 'StudentClassStore'])->name('store.student.class');
        Route::get('student/class/edit/{id}', [StudentClassController::class, 'StudentClassEdit'])->name('student.class.edit');
        Route::post('student/class/update/{id}', [StudentClassController::class, 'StudentClassUpdate'])->name('update.student.class');
        Route::get('student/class/delete/{id}', [StudentClassController::class, 'StudentClassDelete'])->name('student.class.delete');

        // Student Year Routes 
        Route::get('student/year/view', [StudentYearController::class, 'ViewYear'])->name('student.year.view');
        Route::get('student/year/add', [StudentYearController::class, 'StudentYearAdd'])->name('student.year.add');
        Route::post('student/year/store', [StudentYearController::class, 'StudentYearStore'])->name('store.student.year');
        Route::get('student/year/edit/{id}', [StudentYearController::class, 'StudentYearEdit'])->name('student.year.edit');
        Route::post('student/year/update/{id}', [StudentYearController::class, 'StudentYearUpdate'])->name('update.student.year');
        Route::get('student/year/delete/{id}', [StudentYearController::class, 'StudentYearDelete'])->name('student.year.delete');


        // Student Group Routes 
        Route::get('student/group/view', [StudentGroupController::class, 'ViewGroup'])->name('student.group.view');
        Route::get('student/group/add', [StudentGroupController::class, 'StudentGroupAdd'])->name('student.group.add');
        Route::post('student/group/store', [StudentGroupController::class, 'StudentGroupStore'])->name('store.student.group');
        Route::get('student/group/edit/{id}', [StudentGroupController::class, 'StudentGroupEdit'])->name('student.group.edit');
        Route::post('student/group/update/{id}', [StudentGroupController::class, 'StudentGroupUpdate'])->name('update.student.group');
        Route::get('student/group/delete/{id}', [StudentGroupController::class, 'StudentGroupDelete'])->name('student.group.delete');

        // Student Shift Routes 
        Route::get('student/shift/view', [StudentShiftController::class, 'ViewShift'])->name('student.shift.view');
        Route::get('student/shift/add', [StudentShiftController::class, 'StudentShiftAdd'])->name('student.shift.add');
        Route::post('student/shift/store', [StudentShiftController::class, 'StudentShiftStore'])->name('store.student.shift');
        Route::get('student/shift/edit/{id}', [StudentShiftController::class, 'StudentShiftEdit'])->name('student.shift.edit');
        Route::post('student/shift/update/{id}', [StudentShiftController::class, 'StudentShiftUpdate'])->name('update.student.shift');
        Route::get('student/shift/delete/{id}', [StudentShiftController::class, 'StudentShiftDelete'])->name('student.shift.delete');


        // Fee Category Routes 
        Route::get('fee/category/view', [FeeCategoryController::class, 'ViewFeeCat'])->name('fee.category.view');
        Route::get('fee/category/add', [FeeCategoryController::class, 'FeeCatAdd'])->name('fee.category.add');
        Route::post('fee/category/store', [FeeCategoryController::class, 'FeeCatStore'])->name('store.fee.category');
        Route::get('fee/category/edit/{id}', [FeeCategoryController::class, 'FeeCatEdit'])->name('fee.category.edit');
        Route::post('fee/category/update/{id}', [FeeCategoryController::class, 'FeeCategoryUpdate'])->name('update.fee.category');
        Route::get('fee/category/delete/{id}', [FeeCategoryController::class, 'FeeCategoryDelete'])->name('fee.category.delete');

        // Fee Category Amount Routes 
        Route::get('fee/amount/view', [FeeAmountController::class, 'ViewFeeAmount'])->name('fee.amount.view');
        Route::get('fee/amount/add', [FeeAmountController::class, 'AddFeeAmount'])->name('fee.amount.add');
        Route::post('fee/amount/store', [FeeAmountController::class, 'StoreFeeAmount'])->name('store.fee.amount');
        Route::get('fee/amount/edit/{fee_category_id}', [FeeAmountController::class, 'EditFeeAmount'])->name('fee.amount.edit');
        Route::post('fee/amount/update/{fee_category_id}', [FeeAmountController::class, 'UpdateFeeAmount'])->name('update.fee.amount');
        Route::get('fee/amount/details/{fee_category_id}', [FeeAmountController::class, 'DetailsFeeAmount'])->name('fee.amount.details');

        // Exam Type Routes 
        Route::get('exam/type/view', [ExamTypeController::class, 'ViewExamType'])->name('exam.type.view');
        Route::get('exam/type/add', [ExamTypeController::class, 'ExamTypeAdd'])->name('exam.type.add');
        Route::post('exam/type/store', [ExamTypeController::class, 'ExamTypeStore'])->name('store.exam.type');
        Route::get('exam/type/edit/{id}', [ExamTypeController::class, 'ExamTypeEdit'])->name('exam.type.edit');
        Route::post('exam/type/update/{id}', [ExamTypeController::class, 'ExamTypeUpdate'])->name('update.exam.type');
        Route::get('exam/type/delete/{id}', [ExamTypeController::class, 'ExamTypeDelete'])->name('exam.type.delete');


        // School Subject All Routes 
        Route::get('school/subject/view', [SchoolSubjectController::class, 'ViewSubject'])->name('school.subject.view');
        Route::get('school/subject/add', [SchoolSubjectController::class, 'SubjectAdd'])->name('school.subject.add');
        Route::post('school/subject/store', [SchoolSubjectController::class, 'SubjectStore'])->name('store.school.subject');
        Route::get('school/subject/edit/{id}', [SchoolSubjectController::class, 'SubjectEdit'])->name('school.subject.edit');
        Route::post('school/subject/update/{id}', [SchoolSubjectController::class, 'SubjectUpdate'])->name('update.school.subject');
        Route::get('school/subject/delete/{id}', [SchoolSubjectController::class, 'SubjectDelete'])->name('school.subject.delete');


        // Assign Subject Routes
        Route::get('assign/subject/view', [AssignSubjectController::class, 'ViewAssignSubject'])->name('assign.subject.view');
        Route::get('assign/subject/add', [AssignSubjectController::class, 'AddAssignSubject'])->name('assign.subject.add');
        Route::post('assign/subject/store', [AssignSubjectController::class, 'StoreAssignSubject'])->name('store.assign.subject');
        Route::get('assign/subject/edit/{class_id}', [AssignSubjectController::class, 'EditAssignSubject'])->name('assign.subject.edit');
        Route::post('assign/subject/update/{class_id}', [AssignSubjectController::class, 'UpdateAssignSubject'])->name('update.assign.subject');
        Route::get('assign/subject/details/{class_id}', [AssignSubjectController::class, 'DetailsAssignSubject'])->name('assign.subject.details');

        // Designation All Routes
        Route::get('designation/view', [DesignationController::class, 'ViewDesignation'])->name('designation.view');
        Route::get('designation/add', [DesignationController::class, 'DesignationAdd'])->name('designation.add');
        Route::post('designation/store', [DesignationController::class, 'DesignationStore'])->name('store.designation');
        Route::get('designation/edit/{id}', [DesignationController::class, 'DesignationEdit'])->name('designation.edit');
        Route::post('designation/update/{id}', [DesignationController::class, 'DesignationUpdate'])->name('update.designation');
        Route::get('designation/delete/{id}', [DesignationController::class, 'DesignationDelete'])->name('designation.delete');
    });

    // Academic Routes 
    Route::middleware(['admin'])->prefix('academic')->group(function () {

        Route::get('academic/view', [AcademicController::class, 'AcademicView'])->name('academic.view');
        Route::get('academic/add', [AcademicController::class, 'AcademicAdd'])->name('academic.add');
        Route::post('academic/store', [AcademicController::class, 'AcademicStore'])->name('store.academic');
        Route::get('academic/edit/{id}', [AcademicController::class, 'AcademicEdit'])->name('academic.edit');
        Route::post('academic/update/{id}', [AcademicController::class, 'AcademicUpdate'])->name('update.academic');
        Route::get('academic/delete/{id}', [AcademicController::class, 'AcademicDelete'])->name('academic.delete');
    });

    Route::middleware(['admin'])->prefix('students')->group(function () {
        // Student Registration Routes 
        Route::get('reg/view', [StudentRegController::class, 'StudentRegView'])->name('student.registration.view');
        Route::get('reg/Add', [StudentRegController::class, 'StudentRegAdd'])->name('student.registration.add');
        Route::post('reg/store', [StudentRegController::class, 'StudentRegStore'])->name('store.student.registration');
        Route::get('year/class/wise', [StudentRegController::class, 'StudentClassYearWise'])->name('student.year.class.wise');
        Route::get('reg/edit/{student_id}', [StudentRegController::class, 'StudentRegEdit'])->name('student.registration.edit');
        Route::post('reg/update/{student_id}', [StudentRegController::class, 'StudentRegUpdate'])->name('update.student.registration');
        Route::get('reg/promotion/{student_id}', [StudentRegController::class, 'StudentRegPromotion'])->name('student.registration.promotion');
        Route::post('reg/update/promotion/{student_id}', [StudentRegController::class, 'StudentUpdatePromotion'])->name('promotion.student.registration');
        Route::get('reg/details/{student_id}', [StudentRegController::class, 'StudentRegDetails'])->name('student.registration.details');

        // Registration Fee Routes 
        Route::get('reg/fee/view', [RegistrationFeeController::class, 'RegFeeView'])->name('registration.fee.view');
        Route::get('reg/fee/classwisedata', [RegistrationFeeController::class, 'RegFeeClassData'])->name('student.registration.fee.classwise.get');
        Route::get('reg/fee/payslip', [RegistrationFeeController::class, 'RegFeePayslip'])->name('student.registration.fee.payslip');

        // Monthly Fee Routes 
        Route::get('monthly/fee/view', [MonthlyFeeController::class, 'MonthlyFeeView'])->name('monthly.fee.view');
        Route::get('monthly/fee/classwisedata', [MonthlyFeeController::class, 'MonthlyFeeClassData'])->name('student.monthly.fee.classwise.get');
        Route::get('monthly/fee/payslip', [MonthlyFeeController::class, 'MonthlyFeePayslip'])->name('student.monthly.fee.payslip');

        // Exam Fee Routes 
        Route::get('exam/fee/view', [ExamFeeController::class, 'ExamFeeView'])->name('exam.fee.view');
        Route::get('exam/fee/classwisedata', [ExamFeeController::class, 'ExamFeeClassData'])->name('student.exam.fee.classwise.get');
        Route::get('exam/fee/payslip', [ExamFeeController::class, 'ExamFeePayslip'])->name('student.exam.fee.payslip');
    });


    /// Employee Management Routes
    Route::middleware(['admin'])->prefix('employees')->group(function () {

        Route::get('reg/employee/view', [EmployeeRegController::class, 'EmployeeView'])->name('employee.registration.view');
        Route::get('reg/employee/add', [EmployeeRegController::class, 'EmployeeAdd'])->name('employee.registration.add');
        Route::post('reg/employee/store', [EmployeeRegController::class, 'EmployeeStore'])->name('store.employee.registration');
        Route::get('reg/employee/edit/{id}', [EmployeeRegController::class, 'EmployeeEdit'])->name('employee.registration.edit');
        Route::post('reg/employee/update/{id}', [EmployeeRegController::class, 'EmployeeUpdate'])->name('update.employee.registration');
        Route::get('reg/employee/details/{id}', [EmployeeRegController::class, 'EmployeeDetails'])->name('employee.registration.details');

        // Employee Salary All Routes 
        Route::get('salary/employee/view', [EmployeeSalaryController::class, 'SalaryView'])->name('employee.salary.view');
        Route::get('salary/employee/increment/{id}', [EmployeeSalaryController::class, 'SalaryIncrement'])->name('employee.salary.increment');
        Route::post('salary/employee/store/{id}', [EmployeeSalaryController::class, 'SalaryStore'])->name('store.employee.salary.increment');
        Route::get('salary/employee/details/{id}', [EmployeeSalaryController::class, 'SalaryDetails'])->name('employee.salary.details');

        // Employee Leave All Routes 
        Route::get('leave/employee/view', [EmployeeLeaveController::class, 'LeaveView'])->name('employee.leave.view');
        Route::get('leave/employee/add', [EmployeeLeaveController::class, 'LeaveAdd'])->name('employee.leave.add');
        Route::post('leave/employee/store', [EmployeeLeaveController::class, 'LeaveStore'])->name('store.employee.leave');
        Route::get('leave/employee/edit/{id}', [EmployeeLeaveController::class, 'LeaveEdit'])->name('employee.leave.edit');
        Route::post('leave/employee/update/{id}', [EmployeeLeaveController::class, 'LeaveUpdate'])->name('update.employee.leave');
        Route::get('leave/employee/delete/{id}', [EmployeeLeaveController::class, 'LeaveDelete'])->name('employee.leave.delete');


        // Employee Attendance All Routes 
        Route::get('attendance/employee/view', [EmployeeAttendanceController::class, 'AttendanceView'])->name('employee.attendance.view');
        Route::get('attendance/employee/add', [EmployeeAttendanceController::class, 'AttendanceAdd'])->name('employee.attendance.add');
        Route::post('attendance/employee/store', [EmployeeAttendanceController::class, 'AttendanceStore'])->name('store.employee.attendance');
        Route::get('attendance/employee/edit/{date}', [EmployeeAttendanceController::class, 'AttendanceEdit'])->name('employee.attendance.edit');
        Route::get('attendance/employee/details/{date}', [EmployeeAttendanceController::class, 'AttendanceDetails'])->name('employee.attendance.details');


        // Employee Monthly Salary All Routes 
        Route::get('monthly/salary/view', [MonthlySalaryController::class, 'MonthlySalaryView'])->name('employee.monthly.salary');
        Route::get('monthly/salary/get', [MonthlySalaryController::class, 'MonthlySalaryGet'])->name('employee.monthly.salary.get');
        Route::get('monthly/salary/payslip/{employee_id}', [MonthlySalaryController::class, 'MonthlySalaryPayslip'])->name('employee.monthly.salary.payslip');
    });


    Route::middleware(['admin'])->prefix('marks')->group(function () {

        // ajax request
        Route::get('marks/getsubject', [DefaultController::class, 'GetSubject'])->name('marks.getsubject');
        // ajax request
        Route::get('student/marks/getstudents', [DefaultController::class, 'GetStudents'])->name('student.marks.getstudents');
        // Marks Management Routes
        Route::get('marks/entry/add', [MarksController::class, 'MarksAdd'])->name('marks.entry.add');
        Route::post('marks/entry/store', [MarksController::class, 'MarksStore'])->name('store.marks.entry');
        Route::get('marks/entry/edit', [MarksController::class, 'MarksEdit'])->name('marks.entry.edit');
        Route::get('marks/getstudents/edit', [MarksController::class, 'MarksEditGetStudents'])->name('student.edit.getstudents');
        Route::post('marks/entry/update', [MarksController::class, 'MarksUpdate'])->name('marks.entry.update');


        // Marks Entry Grade
        Route::get('marks/grade/view', [GradeController::class, 'MarksGradeView'])->name('marks.entry.grade');
        Route::get('marks/grade/add', [GradeController::class, 'MarksGradeAdd'])->name('marks.grade.add');
        Route::post('marks/grade/store', [GradeController::class, 'MarksGradeStore'])->name('store.marks.grade');
        Route::get('marks/grade/edit/{id}', [GradeController::class, 'MarksGradeEdit'])->name('marks.grade.edit');
        Route::post('marks/grade/update/{id}', [GradeController::class, 'MarksGradeUpdate'])->name('update.marks.grade');
    });

    /// Account Management Routes  
    Route::middleware(['admin'])->prefix('accounts')->group(function () {
        Route::get('student/fee/view', [StudentFeeController::class, 'StudentFeeView'])->name('student.fee.view');
        Route::get('student/fee/add', [StudentFeeController::class, 'StudentFeeAdd'])->name('student.fee.add');
        Route::get('student/fee/getstudent', [StudentFeeController::class, 'StudentFeeGetStudent'])->name('account.fee.getstudent');
        Route::post('student/fee/store', [StudentFeeController::class, 'StudentFeeStore'])->name('store.account.fee');

        // Employee Salary Routes
        Route::get('account/salary/view', [AccountSalaryController::class, 'AccountSalaryView'])->name('account.salary.view');
        Route::get('account/salary/add', [AccountSalaryController::class, 'AccountSalaryAdd'])->name('account.salary.add');
        Route::get('account/salary/getemployee', [AccountSalaryController::class, 'AccountSalaryGetEmployee'])->name('account.salary.getemployee');
        Route::post('account/salary/store', [AccountSalaryController::class, 'AccountSalaryStore'])->name('store.account.salary');

        // Other Cost Rotues 
        Route::get('other/cost/view', [OtherCostController::class, 'OtherCostView'])->name('other.cost.view');
        Route::get('other/cost/add', [OtherCostController::class, 'OtherCostAdd'])->name('other.cost.add');
        Route::post('other/cost/store', [OtherCostController::class, 'OtherCostStore'])->name('store.other.cost');
        Route::get('other/cost/edit/{id}', [OtherCostController::class, 'OtherCostEdit'])->name('edit.other.cost');
        Route::post('other/cost/update/{id}', [OtherCostController::class, 'OtherCostUpdate'])->name('update.other.cost');
    });

    /// Report Management All Routes  
    Route::middleware(['admin'])->prefix('reports')->group(function () {

        Route::get('monthly/profit/view', [ProfitController::class, 'MonthlyProfitView'])->name('monthly.profit.view');
        Route::get('monthly/profit/datewais', [ProfitController::class, 'MonthlyProfitDatewais'])->name('report.profit.datewais.get');
        Route::get('monthly/profit/pdf', [ProfitController::class, 'MonthlyProfitPdf'])->name('report.profit.pdf');

        // MarkSheet Generate Routes 
        Route::get('marksheet/generate/view', [MarkSheetController::class, 'MarkSheetView'])->name('marksheet.generate.view');
        Route::get('marksheet/generate/get', [MarkSheetController::class, 'MarkSheetGet'])->name('report.marksheet.get');

        // Attendance Report Routes 
        Route::get('attendance/report/view', [AttendReportController::class, 'AttenReportView'])->name('attendance.report.view');
        Route::get('report/attendance/get', [AttendReportController::class, 'AttenReportGet'])->name('report.attendance.get');

        // Student Result Report Routes 
        Route::get('student/result/view', [ResultReportController::class, 'ResultView'])->name('student.result.view');
        Route::get('student/result/get', [ResultReportController::class, 'ResultGet'])->name('report.student.result.get');

        // Student ID Card Routes 
        Route::get('student/idcard/view', [ResultReportController::class, 'IdcardView'])->name('student.idcard.view');
        Route::get('student/idcard/get', [ResultReportController::class, 'IdcardGet'])->name('report.student.idcard.get');
    });
});
// End Admin routes

// Moderator routes
Route::prefix('moderator')->group(function () {
    // Auth
    Route::get('login', [ModeratorController::class, 'ModeratorLogin'])->name('moderator_login');
    Route::post('login', [ModeratorController::class, 'ModeratorLoginStore'])->name('moderator_login_store');
    Route::get('logout', [ModeratorController::class, 'ModeratorLogout'])->name('moderator_logout')->middleware('moderator');
    Route::get('register', [ModeratorController::class, 'ModeratorRegister'])->name('moderator_register');
    Route::post('register', [ModeratorController::class, 'ModeratorRegisterStore'])->name('moderator_register_store');

    // Dashboard
    Route::get('dashboard', [ModeratorController::class, 'ModeratorDashboard'])->name('moderator_dashboard')->middleware('moderator');
});
// End Moderator routes
