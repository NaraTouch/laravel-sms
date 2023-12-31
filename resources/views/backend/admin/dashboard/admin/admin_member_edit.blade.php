@extends('backend.admin.dashboard.admin_master')
@section('title', 'SMS | Dashboard - Admin edit')
@section('admin')
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <div class="content-wrapper">
        <div class="container-full">
            <section class="content">
                <div class="box">
                    <div class="box-header with-border">
                        <h4 class="box-title">Edit Admin </h4>
                    </div>
                    <div class="box-body">
                        <div class="row">
                            <div class="col">
                                <form method="post" action="{{ route('update.admin.member', $editData->id) }}"
                                    enctype="multipart/form-data"
                                    autocomplete="off">
                                    @csrf
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>Admin Name <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="text" name="name" class="form-control"
                                                                required="" value="{{ $editData->name }}">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>Email <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="text" name="email" class="form-control"
                                                            value="{{ $editData->email }}" required="">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>Mobile Number <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="text" name="mobile" class="form-control"
                                                                required="" value="{{ $editData->mobile }}">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>Address <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="text" name="address" class="form-control"
                                                                required="" value="{{ $editData->address }}">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>Gender <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <select name="gender" id="gender" required=""
                                                                class="form-control">
                                                                <option value="" selected="" disabled="">Select
                                                                    Gender</option>
                                                                <option value="Male"
                                                                    {{ $editData->gender == 'Male' ? 'selected' : '' }}>Male
                                                                </option>
                                                                <option value="Female"
                                                                    {{ $editData->gender == 'Female' ? 'selected' : '' }}>
                                                                    Female</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>Religion <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <select name="religion" id="religion" required=""
                                                                class="form-control">
                                                                <option value="" selected="" disabled="">Select
                                                                    Religion</option>
                                                                <option value="Islam"
                                                                    {{ $editData->religion == 'Islam' ? 'selected' : '' }}>
                                                                    Islam</option>
                                                                <option value="Hindu"
                                                                    {{ $editData->religion == 'Hindu' ? 'selected' : '' }}>
                                                                    Hindu</option>
                                                                <option value="Christan"
                                                                    {{ $editData->religion == 'Christan' ? 'selected' : '' }}>
                                                                    Christan</option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>Date of Birth <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="date" name="dob" class="form-control"
                                                                required="" value="{{ $editData->dob }}">
                                                        </div>
                                                    </div>
                                                </div>
                                                {{-- <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>Designation <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <select name="designation_id" required=""
                                                                class="form-control">
                                                                <option value="" selected="" disabled="">
                                                                    Select Year</option>
                                                                @foreach ($designation as $desi)
                                                                    <option value="{{ $desi->id }}"
                                                                        {{ $editData->designation_id == $desi->id ? 'selected' : '' }}>
                                                                        {{ $desi->name }}</option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div> --}}
                                            </div>
                                            <div class="row">
                                                @if (!$editData)
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <h5>Salary <span class="text-danger">*</span></h5>
                                                            <div class="controls">
                                                                <input type="text" name="salary" class="form-control"
                                                                    required="" value="{{ $editData->salary }}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                @endif
                                                @if (!$editData)
                                                    <div class="col-md-3">
                                                        <div class="form-group">
                                                            <h5>Joining Date <span class="text-danger">*</span></h5>
                                                            <div class="controls">
                                                                <input type="date" name="join_date"
                                                                    class="form-control" required=""
                                                                    value="{{ $editData->join_date }}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                @endif
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>Current password <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="password" name="current_password" class="form-control" autocomplete="off" placeholder="Current password">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>New password <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="password" name="new_password" class="form-control" autocomplete="off" placeholder="New password">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <h5>Confirm password <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="password" name="confirm_password" class="form-control" autocomplete="off" placeholder="Confirm New password">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <h5>Secret Code <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="text" name="secret_code" class="form-control"
                                                                value="{{ $editData->secret_code }}" required="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <h5>Profile Image <span class="text-danger">*</span></h5>
                                                        <div class="controls">
                                                            <input type="file" name="image" class="form-control"
                                                                id="image">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <img id="showImage"
                                                                src="{{ !empty($editData->image) ? url('upload/employee_images/' . $editData->image) : url('upload/no_image.jpg') }}"
                                                                style="width: 100px; width: 100px; border: 1px solid #000000;">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <h5>Role <span class="text-danger"> </span></h5>
                                                        <div class="controls">
                                                            <select name="role_id" required="" class="form-control">
                                                                <option value="" selected="" disabled="">Select
                                                                    Role</option>
                                                                @foreach ($editData->Role as $role)
                                                                    <option value="{{ $role->id }}"
                                                                        {{ $editData->role_id == $role->id ? 'selected' : '' }}>
                                                                        {{ $role->name }}</option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="text-xs-right">
                                                <input type="submit" class="btn btn-rounded btn-info mb-5"
                                                    value="Update">
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
