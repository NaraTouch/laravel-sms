@extends('backend.admin.dashboard.admin_master')
@section('title', 'SMS | Dashboard - Method Edit')
@section('admin')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <div class="content-wrapper">
        <div class="container-full">
            <section class="content">
                <div class="box">
                    <div class="box-header with-border">
                        <h4 class="box-title">Edit Method </h4>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col">
                                <form method="post" action="{{ route('method_edit_store', $editData->id) }}"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>Method Name <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="text" name="name" class="form-control"
                                                                required="" value="{{$editData->name}}">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>System Name <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="text" name="sys_name" class="form-control"
                                                                required="" value="{{$editData->sys_name}}">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>Is Menu <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <select name="is_menu" id="is_menu" required=""
                                                                class="form-control">
                                                                <option value="" selected="" disabled="">Select
                                                                    Option</option>
                                                                <option value="1"
                                                                    {{ $editData->is_menu == '1' ? 'selected' : '' }}>
                                                                    Menu
                                                                </option>
                                                                <option value="0"
                                                                    {{ $editData->is_menu == '0' ? 'selected' : '' }}>
                                                                    Not Menu</option>
                                                            </select>
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
                                                            value="{{$editData->description}}"></textarea>
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

    <script type="text/javascript">
        $(document).ready(function() {
            $('#image').change(function(e) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    $('#showImage').attr('src', e.target.result);
                }
                reader.readAsDataURL(e.target.files['0']);
            });
        });
    </script>

@endsection
