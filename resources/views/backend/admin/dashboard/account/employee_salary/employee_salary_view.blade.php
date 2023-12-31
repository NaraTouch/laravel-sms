@extends('backend.admin.dashboard.admin_master')
@section('title', 'SMS | Dashboard - Employee Salary')
@section('admin')
    <div class="content-wrapper">
        <div class="container-full">
            <section class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">Employee Salary List </h3>
                                @feature(account.salary.add
                                @<a href="{{ route('account.salary.add') }}" style="float: right;"
                                    class="btn btn-rounded btn-success mb-5"> Add / Edit Employee Salary</a>)
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th width="5%">SL</th>
                                                <th>ID No</th>
                                                <th>Name </th>
                                                <th>Amount</th>
                                                <th>Date</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($allData as $key => $value)
                                                <tr>
                                                    <td>{{ $key + 1 }}</td>
                                                    <td> {{ $value['user']['id_no'] }}</td>
                                                    <td> {{ $value['user']['name'] }}</td>
                                                    <td> {{ $value->amount }}</td>
                                                    <td> {{ date('M Y', strtotime($value->date)) }}</td>

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
