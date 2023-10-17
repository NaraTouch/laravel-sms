@extends('backend.admin.dashboard.admin_master')
@section('title', 'SMS | Setting')
@section('admin')
    <div class="content-wrapper">
        <div class="container-full">
            <section class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">Module List</h3>
                                @feature(module.add
                                @<a href="{{ route('module.add') }}" style="float: right;"
                                    class="btn btn-rounded btn-success mb-5"> Add Module</a>)
                            </div>
                            <div class="box-body">
                                <div class="table-responsive">
                                    <table id="example1" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th width="5%">SL</th>
                                                <th>Positio & Name & Icon</th>
                                                <th>Group</th>
                                                <th>Methods</th>
                                                <th width="25%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($allData as $key => $module)
                                                <tr>
                                                    <td>{{ $key + 1 }}</td>
                                                    <td> {{ $module['position'] }}.
                                                        <span>
                                                            <i data-feather="{{$module['icon']}}"></i> 
                                                        </span>
                                                         {{ $module['name'] }}
                                                    </td>
                                                    <td> {{ $module['group'] }}</td>
                                                    <td> 
                                                        @if (isset($module['methods']))
                                                            @foreach ($module['methods'] as $k => $method)
                                                                @if ($k > 0)
                                                                    <br>
                                                                @endif
                                                                {{ $k + 1 }}. {{ $method['name'] }}
                                                            @endforeach
                                                        @endif
                                                    </td>
                                                    <td>
                                                        @feature(module.edit
                                                        @<a href="{{ route('module.edit', $module['id']) }}"
                                                            class="btn btn-info">Edit</a>)

                                                        @feature(method.add
                                                        @<a href="{{ route('method.add', $module['id']) }}"
                                                            class="btn btn-info">Add Method</a>)

                                                        @feature(method.view
                                                        @<a href="{{ route('method.view', $module['id']) }}"
                                                            class="btn btn-success">View Method</a>)
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


