@extends('backend.admin.dashboard.admin_master')
@section('title', 'SMS | Dashboard - Employee')
@section('admin')
    <div class="content-wrapper">
        <div class="container-full">
            <section class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">Admin List</h3>
                                <a href="{{ route('admin_member_add') }}" style="float: right;"
                                    class="btn btn-rounded btn-success mb-5"> Add Admin</a>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th width="5%">SL</th>
                                                <th>Name</th>
                                                {{-- <th>ID NO</th> --}}
                                                <th>Mobile</th>
                                                <th>Gender</th>
                                                <th>Status</th>
                                                {{-- <th>Join Date</th>
                                                <th>Salary</th> --}}
                                                <th width="25%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($allData as $key => $admin)
                                                <tr>
                                                    <td>{{ $key + 1 }}</td>
                                                    <td> {{ $admin->name }}</td>
                                                    {{-- <td> {{ $admin->id_no }}</td> --}}
                                                    <td> {{ $admin->mobile }}</td>
                                                    <td> {{ $admin->gender }}</td>
                                                    <td>
                                                        @if ($admin->status)
                                                            <span class="btn-xs btn-success disabled">Active</span>
                                                        @else
                                                            <span class="btn-xs btn-danger disabled">Disactive</span>
                                                        @endif
                                                    </td>
                                                    {{-- <td> {{ $admin->join_date }}</td>
                                                    <td> {{ $admin->salary }}</td> --}}
                                                    <td>
                                                        <a href="{{ route('admin_member_edit', $admin->id) }}"
                                                            class="btn btn-info">Edit</a>
                                                        <a target="_blank"
                                                            href="{{ route('admin_member_delete', $admin->id) }}"
                                                            class="btn btn-danger">Disactive</a>
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
