@extends('backend.admin.dashboard.admin_master')
@section('title', 'SMS | Dashboard - Class add')
@section('admin')
    <div class="content-wrapper">
        <div class="container-full">
            <section class="content">
                <form method="post" action="{{ route('store.academic') }}">
                @csrf
                    <div class="box">
                        <div class="box-header with-border">
                            <h4 class="box-title">Add Academy</h4>
                            <div style="float: right;">
                                <input type="submit" class="btn btn-rounded btn-info mb-5"
                                    value="Submit">
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <h5>Class <span class="text-danger"> </span></h5>
                                                <div class="controls">
                                                    <select name="class_id" id="class_id" required="" class="form-control">
                                                        <option value="" selected="" disabled="">Select Class
                                                        </option>
                                                        @foreach ($classes as $class)
                                                            <option value="{{ $class->id }}">{{ $class->name }}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <h5>Academy Name <span class="text-danger">*</span></h5>
                                                <div class="controls">
                                                    <input type="text" name="name" class="form-control"
                                                        required="">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <h5>Start Date <span class="text-danger">*</span></h5>
                                                <div class="controls">
                                                    <input type="date" name="start_date" class="form-control"
                                                        required="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <h5>End Date <span class="text-danger">*</span></h5>
                                                <div class="controls">
                                                    <input type="date" name="end_date" class="form-control"
                                                        required="">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <h5>Status <span class="text-danger">*</span></h5>
                                                <div class="controls">
                                                    <select name="status" id="status" required=""
                                                        class="form-control">
                                                        <option value="" selected="" disabled="">Select
                                                            Status</option>
                                                        <option value="1">Active</option>
                                                        <option value="0">Disactive</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </section>
        </div>
    </div>
@endsection
