@extends('backend.admin.dashboard.admin_master')
@section('title', 'SMS | Dashboard - Module Edit')
@section('admin')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <div class="content-wrapper">
        <div class="container-full">
            <section class="content">
                <div class="box">
                    <div class="box-header with-border">
                        <h4 class="box-title">Edit Module </h4>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col">
                                <form method="post" action="{{ route('update.module', $editData->id) }}"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>Module Name <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="text" name="name" class="form-control"
                                                                required="" value="{{ $editData->name }}">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>Prefix <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="text" name="prefix" class="form-control"
                                                                required="" value="{{ $editData->prefix }}">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>Group <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <select name="group" id="group" required=""
                                                                class="form-control">
                                                                <option value="" selected="" disabled="">Select
                                                                    Group</option>
                                                                <option value="app"
                                                                    {{ $editData->group == 'app' ? 'selected' : '' }}>
                                                                    App
                                                                </option>
                                                                <option value="sys"
                                                                    {{ $editData->group == 'sys' ? 'selected' : '' }}>
                                                                    Setting</option>
                                                                <option value="repo"
                                                                    {{ $editData->group == 'repo' ? 'selected' : '' }}>
                                                                    Report</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>Position <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="text" name="position" class="form-control"
                                                                required="" value="{{$editData->position}}">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>icon <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="text" name="icon" class="form-control"
                                                                required="" value="{{$editData->icon}}">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>Description</h5>
                                                        <div class="controls">
                                                            <textarea id="description" 
                                                            name="description" 
                                                            class="form-control" 
                                                            rows="4" cols="50"
                                                            value="{{ $editData->description }}"
                                                            ></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="text-xs-right">
                                                <input type="submit" class="btn btn-rounded btn-info mb-5"
                                                    value="Submit">
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </div>
@endsection
