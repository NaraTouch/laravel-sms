@extends('backend.admin.dashboard.admin_master')
@section('title', 'SMS | Dashboard - Fee category')
@section('admin')
    <div class="content-wrapper">
        <div class="container-full">
            <section class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">Student Fee Category List</h3>
                                @feature(fee.category.add
                                @<a href="{{ route('fee.category.add') }}" style="float: right;"
                                    class="btn btn-rounded btn-success mb-5"> Add Fee Category</a>)
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
                                            @foreach ($allData as $key => $fee)
                                                <tr>
                                                    <td>{{ $key + 1 }}</td>
                                                    <td> {{ $fee->name }}</td>
                                                    <td>
                                                        @feature(fee.category.edit
                                                        @<a href="{{ route('fee.category.edit', $fee->id) }}"
                                                            class="btn btn-info">Edit</a>)

                                                        @feature(fee.category.delete
                                                        @<a href="{{ route('fee.category.delete', $fee->id) }}"
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
