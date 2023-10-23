@extends('backend.admin.dashboard.admin_master')
@section('title', 'SMS | Dashboard - Students Registration')
@section('admin')
    <div class="content-wrapper">
        <div class="container-full">
            <section class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="box bb-3 border-warning">
                            <form method="GET" action="{{ route('student.year.class.wise') }}">
                                <div class="box-header">
                                    <h4 class="box-title">Student <strong>Search</strong></h4>
                                    <div style="float: right;">
                                        <input type="submit" class="btn btn-rounded btn-dark mb-5" name="search"
                                            value="Search">
                                    </div>
                                </div>
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <h5>Student ID <span class="text-danger"> </span></h5>
                                                <div class="controls">
                                                    <input type="text" name="student_id_no" class="form-control" value="{{ @$student_id_no }}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <h5>Name <span class="text-danger"> </span></h5>
                                                <div class="controls">
                                                    <input type="text" name="name" class="form-control" value="{{ @$name }}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">Student List</h3>
                                @feature(student.registration.add
                                @<a href="{{ route('student.registration.add') }}" style="float: right;"
                                    class="btn btn-rounded btn-success mb-5"> Add Student </a>)
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    @if (isset($_POST['search']))
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th width="5%">SL</th>
                                                    <th>Name</th>
                                                    <th>ID No</th>
                                                    <th>Image</th>
                                                    <th width="25%">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($allData as $key => $value)
                                                    <tr>
                                                        <td>{{ $key + 1 }}</td>
                                                        <td> {{ $value->student_name }}</td>
                                                        <td> {{ $value->student_id_no }}</td>
                                                        <td>
                                                            <img src="{{ isset($value->student_image) ? url('upload/student_images/'.$value->student_image) : url('upload/no_image.jpg') }}"
                                                                style="width: 60px; width: 60px;">
                                                        </td>
                                                        <td>
                                                            @feature(student.registration.edit
                                                            @<a title="Edit"
                                                                href="{{ route('student.registration.edit', $value->student_id) }}"
                                                                class="btn btn-info"> <i class="fa fa-edit"></i> </a>)

                                                            @feature(student.registration.promotion
                                                            @<a title="Promotion"
                                                                href="{{ route('student.registration.promotion', $value->student_id) }}"
                                                                class="btn btn-primary"><i class="fa fa-check"></i></a>)

                                                            @feature(student.registration.details
                                                            @<a target="_blank" title="Details"
                                                                href="{{ route('student.registration.details', $value->student_id) }}"
                                                                class="btn btn-danger"><i class="fa fa-eye"></i></a>)
                                                        </td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                            <tfoot>
                                            </tfoot>
                                        </table>
                                    @else
                                        <table id="example1" class="table table-bordered table-striped">
                                            <thead>
                                                <tr>
                                                    <th width="5%">SL</th>
                                                    <th>Name</th>
                                                    <th>ID No</th>
                                                    <th>Image</th>
                                                    <th width="25%">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($allData as $key => $value)
                                                    <tr>
                                                        <td>{{ $key + 1 }}</td>
                                                        <td> {{ $value->student_name }}</td>
                                                        <td> {{ $value->student_id_no }}</td>
                                                        <td>
                                                            <img src="{{ isset($value->student_image) ? url('upload/student_images/'.$value->student_image) : url('upload/no_image.jpg') }}"
                                                                style="width: 60px; width: 60px;">
                                                        </td>
                                                        <td>
                                                            <a title="Edit"
                                                                href="{{ route('student.registration.edit', $value->student_id) }}"
                                                                class="btn btn-info"> <i class="fa fa-edit"></i> </a>

                                                            <a title="Promotion"
                                                                href="{{ route('student.registration.promotion', $value->student_id) }}"
                                                                class="btn btn-primary"><i class="fa fa-check"></i></a>

                                                            <a target="_blank" title="Details"
                                                                href="{{ route('student.registration.details', $value->student_id) }}"
                                                                class="btn btn-danger"><i class="fa fa-eye"></i></a>
                                                        </td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                            <tfoot>
                                            </tfoot>
                                        </table>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
@endsection
