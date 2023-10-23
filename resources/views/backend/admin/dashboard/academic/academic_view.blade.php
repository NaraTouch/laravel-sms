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
                                <h3 class="box-title">Academy List</h3>
                                @feature(academic.add
                                @<a href="{{ route('academic.add') }}" style="float: right;"
                                    class="btn btn-rounded btn-success mb-5"> Create Academy Class</a>)
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th width="5%">SL</th>
                                                <th>Academy Name</th>
                                                <th>Class Type</th>
                                                <th>Start/End</th>
                                                <th>Status</th>
                                                <th width="25%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($allData as $key => $value)
                                                <tr>
                                                    <td> {{ $key + 1 }} </td>
                                                    <td> {{ $value->name }} </td>
                                                    <td> {{ $value->student_class_name }} </td>
                                                    <td>
                                                        {{ $value->start_date }}
                                                        <br>
                                                        {{ $value->end_date }}
                                                    </td>
                                                    <td>
                                                        @if ($value->status)
                                                        <span class="btn-xs btn-success disabled">Active</span>
                                                        @else
                                                            <span class="btn-xs btn-danger disabled">Disactive</span>
                                                        @endif
                                                    </td>
                                                    <td>
                                                        @feature(academic.edit
                                                        @<a href="{{ route('academic.edit', $value->id) }}"
                                                            class="btn btn-info">Edit</a>)
                                                        @if ($value->status)
                                                            @feature(academic.delete
                                                            @<a href="{{ route('academic.delete', ['id' => $value->id, 'status' => 0]) }}"
                                                                class="btn btn-danger" id="delete">Disactive</a>)
                                                        @else
                                                            @feature(academic.delete
                                                            @<a href="{{ route('academic.delete', ['id' => $value->id, 'status' => 1]) }}"
                                                                class="btn btn-success" id="delete">Active</a>)
                                                        @endif
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
