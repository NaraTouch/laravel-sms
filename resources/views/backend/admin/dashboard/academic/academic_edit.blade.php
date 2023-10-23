@extends('backend.admin.dashboard.admin_master')
@section('title', 'SMS | Dashboard - Class add')
@section('admin')
    <div class="content-wrapper">
        <div class="container-full">
            <section class="content">
                <form method="post" action="{{ route('update.academic', $editData->id) }}">
                @csrf
                    <div class="box">
                        <div class="box-header with-border">
                            <h4 class="box-title">Edit Academy</h4>
                            <div style="float: right;">
                                <input type="submit" class="btn btn-rounded btn-info mb-5"
                                    value="Update">
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
                                                    <select name="class_id" required="" class="form-control">
                                                        <option value="" selected="" disabled="">
                                                            Select Class</option>
                                                        @foreach ($classes as $class)
                                                            <option value="{{ $class->id }}"
                                                                {{ $editData->class_id == $class->id ? 'selected' : '' }}>
                                                                {{ $class->name }}</option>
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
                                                        required=""
                                                        value="{{ $editData->name }}">
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
                                                        required=""
                                                        value="{{ $editData->start_date }}">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <h5>End Date <span class="text-danger">*</span></h5>
                                                <div class="controls">
                                                    <input type="date" name="end_date" class="form-control"
                                                        required=""
                                                        value="{{ $editData->end_date }}">
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
                                                        <option value="" selected="" disabled="">Select Status</option>
                                                        <option value="1" {{ $editData->status == '1' ? 'selected' : '' }}>Active</option>
                                                        <option value="0" {{ $editData->status == '0' ? 'selected' : '' }}>Disactive</option>
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
