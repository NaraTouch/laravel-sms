@extends('backend.admin.dashboard.admin_master')
@section('title', 'SMS | Role')
@section('admin')
    <div class="content-wrapper">
        <div class="container-full">
            <section class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">Role List</h3>
                                @feature(role.add@<a href="{{ route('role.add') }}" style="float: right;" class="btn btn-rounded btn-success mb-5"> Add Role</a>)
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th width="5%">SL</th>
                                                <th>Name</th>
                                                <th>Status</th>
                                                <th>Description</th>
                                                <th width="25%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($allData as $key => $role)
                                                <tr>
                                                    <td>{{ $key + 1 }}</td>
                                                    <td> {{ $role->name }}</td>
                                                    <td>
                                                        @if ($role->status)
                                                            <span class="btn-xs btn-success disabled">Active</span>
                                                        @else
                                                            <span class="btn-xs btn-danger disabled">Disactive</span>
                                                        @endif
                                                    </td>
                                                    <td> {{ $role->description }}</td>
                                                    <td>
                                                        @feature(role.edit@<a href="{{ route('role.edit', $role->id) }}" class="btn btn-info">Edit</a>)
                                                        @if (!$role->status)
                                                        @feature(role.delete@<a href="{{ route('role.delete', $role->id) }}" class="btn btn-success">Enable</a>)
                                                        @else
                                                        @feature(role.delete@<a href="{{ route('role.delete', $role->id) }}" class="btn btn-danger">Disabled</a>)
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
