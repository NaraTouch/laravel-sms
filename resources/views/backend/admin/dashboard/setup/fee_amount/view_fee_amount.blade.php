@extends('backend.admin.dashboard.admin_master')
@section('title', 'SMS | Dashboard - View fee amount')
@section('admin')
    <div class="content-wrapper">
        <div class="container-full">
            <section class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">Student Fee Amount List</h3>
                                @feature(fee.amount.add
                                @<a href="{{ route('fee.amount.add') }}" style="float: right;"
                                    class="btn btn-rounded btn-success mb-5"> Add Fee Amount</a>)
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th width="5%">SL</th>
                                                <th>Fee Category</th>
                                                <th width="25%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($allData as $key => $amount)
                                                <tr>
                                                    <td>{{ $key + 1 }}</td>
                                                    <td> {{ $amount['fee_cateogry']['name'] }}</td>
                                                    <td>
                                                        @feature(fee.amount.edit
                                                        @<a href="{{ route('fee.amount.edit', $amount->fee_category_id) }}"
                                                            class="btn btn-info">Edit</a>)
                                                        
                                                        @feature(fee.amount.details
                                                        @<a href="{{ route('fee.amount.details', $amount->fee_category_id) }}"
                                                            class="btn btn-primary">Details</a>)
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
