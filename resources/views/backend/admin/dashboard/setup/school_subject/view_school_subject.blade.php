@extends('backend.admin.dashboard.admin_master')
@section('title', 'SMS | Dashboard - School subjects')
@section('admin')
    <div class="content-wrapper">
        <div class="container-full">
            <section class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">School Subject List</h3>
                                @feature(school.subject.add
                                @<a href="{{ route('school.subject.add') }}" style="float: right;"
                                    class="btn btn-rounded btn-success mb-5"> Add Subject</a>)
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
                                            @foreach ($allData as $key => $subject)
                                                <tr>
                                                    <td>{{ $key + 1 }}</td>
                                                    <td> {{ $subject->name }}</td>
                                                    <td>
                                                        @feature(school.subject.edit
                                                        @<a href="{{ route('school.subject.edit', $subject->id) }}"
                                                            class="btn btn-info">Edit</a>)

                                                        @feature(school.subject.delete
                                                        @<a href="{{ route('school.subject.delete', $subject->id) }}"
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
