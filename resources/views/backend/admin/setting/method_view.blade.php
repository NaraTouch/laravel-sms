@extends('backend.admin.dashboard.admin_master')
@section('title', 'SMS | Setting Method')
@section('admin')
    <div class="content-wrapper">
        <div class="container-full">
            <section class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">Method List</h3>
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th width="5%">SL</th>
                                                <th>Name</th>
                                                <th>System Name</th>
                                                <th>Is Menu</th>
                                                <th width="25%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($allData as $key => $method)
                                                <tr>
                                                    <td>{{ $key + 1 }}</td>
                                                    <td> {{ $method->name }}</td>
                                                    <td> {{ $method->sys_name }}</td>
                                                    <td>
                                                        @if ($method->is_menu)
                                                            <span class="btn-xs btn-success disabled">Menu</span>
                                                        @else
                                                            <span class="btn-xs btn-danger disabled">No Menu</span>
                                                        @endif
                                                    </td>
                                                    <td>
                                                        <a href="{{ route('method_edit', $method->id) }}"
                                                            class="btn btn-info">Edit</a>
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
