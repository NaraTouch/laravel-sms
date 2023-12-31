@extends('backend.admin.dashboard.admin_master')
@section('title', 'SMS | Dashboard - Classes')
@section('admin')
    <div class="content-wrapper">
        <div class="container-full">
            <section class="content">
                <div class="row">
                    <div class="col-12">

                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">Student Class List</h3>
                                @feature(student.class.add
                                @<a href="{{ route('student.class.add') }}" style="float: right;"
                                    class="btn btn-rounded btn-success mb-5"> Add Student Class</a>)
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th width="5%">SL</th>
                                                <th>Name</th>
                                                <th width="25%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($allData as $key => $student)
                                                <tr>
                                                    <td>{{ $key + 1 }}</td>
                                                    <td> {{ $student->name }}</td>
                                                    <td>
                                                        @feature(student.class.edit
                                                        @<a href="{{ route('student.class.edit', $student->id) }}"
                                                            class="btn btn-info">Edit</a>)

                                                        @feature(student.class.delete
                                                        @<a href="{{ route('student.class.delete', $student->id) }}"
                                                            class="btn btn-danger" id="delete">Delete</a>)
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                        <tfoot>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
@endsection
