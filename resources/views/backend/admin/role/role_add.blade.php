@extends('backend.admin.dashboard.admin_master')
@section('title', 'SMS | Setting - Role add')
@section('admin')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        fieldset {
            background-color: rgba(111, 66, 193, 0.3);
            border-radius: 4px;
        }

        legend {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 4px;
            color: var(--purple);
            font-size: 17px;
            font-weight: bold;
            padding: 3px 5px 3px 7px;
            width: auto;
        }

    </style>
    <div class="content-wrapper">
        <div class="container-full">
            <section class="content">
                <form method="post" action="{{ route('store.role') }}"enctype="multipart/form-data">
                    @csrf
                    <div class="box">
                        <div class="box-header with-border">
                            <h4 class="box-title">Add Role </h4>
                            <div style="float: right;">
                                <input type="submit" class="btn btn-rounded btn-info mb-5"
                                    value="Submit">
                            </div>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>Role Name <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="text" name="name" class="form-control"
                                                                required="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
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
                                            <div class="row">
                                                <div class="col-md-8">
                                                    <div class="form-group">
                                                        <h5>Description</h5>
                                                        <div class="controls">
                                                            <textarea id="description" name="description" class="form-control" rows="4" cols="50"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="box">
                        <div class="box-header with-border">
                            <h4 class="box-title">Add Permission </h4>
                        </div>
                        <div class="box-body">
                            <div class="row">
                                <div class="col">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="row">
                                                @foreach ($allData as $key => $module)
                                                    <fieldset class="col-3 px-3 py-3 mx-3 my-3">
                                                        <?php
                                                            $group = 'Application';
                                                            if ($module['group'] == 'sys') : $group = 'System Setting';
                                                            elseif ($module['group'] == 'repo') : $group = 'Report Interface';
                                                            endif;
                                                        ?>
                                                        <legend>{{$group}}</legend>
                                                        <div class="col-8">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" id="{{$module['id']}}" name="permission[{{$module['id']}}]" value="{{$module['id']}}">
                                                                <label class="form-check-label" for="{{$module['id']}}">{{$module['name']}}</label>
                                                                <div class="form-check">
                                                                    @foreach ($module['methods'] as $method)
                                                                    <input class="form-check-input" type="checkbox" id="{{$module['id']}}_{{$method['id']}}" name="permission[{{$module['id']}}][]" value="{{$method['id']}}">
                                                                    <label class="form-check-label" for="{{$module['id']}}_{{$method['id']}}">{{$method['name']}}</label>
                                                                    @endforeach
                                                                </div>
                                                            </div>
                                                    </fieldset>
                                                @endforeach
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

    <script type="text/javascript">
        $(document).ready(function() {
            $('.form-check-input').change(function() {
                var id = $(this).attr('id');
                if (id.includes('_')) {
                    var mainCheckboxId = id.split('_')[0];
                    var mainCheckbox = $('#' + mainCheckboxId);
                    if ($(this).is(':checked')) {
                        mainCheckbox.prop('checked', true);
                    } else {
                        var subCheckboxes = $('[id^="' + mainCheckboxId + '_"]');
                        if (subCheckboxes.filter(':checked').length === 0) {
                            mainCheckbox.prop('checked', false);
                        }
                    }
                }
            });
        });
    </script>

@endsection
