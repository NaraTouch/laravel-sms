@php
    $prefix = Request::route()->getprefix();
    $route = Route::current()->getName();
    $menu = session('_session')['menu'];
@endphp
<aside class="main-sidebar">
    <section class="sidebar">

        <div class="user-profile">
            <div class="ulogo">
                <a href="/">
                    <div class="d-flex align-items-center justify-content-center">
                        <img src="{{ asset('assets/images/logo-dark.png') }}" alt="Logo">
                        <h3><b>School</b> Management</h3>
                    </div>
                </a>
            </div>
        </div>

        <ul class="sidebar-menu" data-widget="tree">
            @php
                $sys = 1;
                $repo = 1;
            @endphp
            @foreach ($menu as $index => $item)
                @if ($item['group'] === 'sys' && $sys === 1)
                    @php $sys = $sys+1; @endphp
                    <li class="header nav-small-cap">System Setting</li>
                @endif
                @if ($item['group'] === 'repo' && $repo === 1)
                    @php $repo = $repo+1; @endphp
                    <li class="header nav-small-cap">Report Interface</li>
                @endif
                @if (sizeof($item['sys_methods']) === 1)
                    @if ($item['sys_methods'][0]['is_menu'] === 0)
                        <li class="{{ $route == $item['prefix'] ? 'active' : '' }}">
                            <a href="{{ route($item['sys_methods'][0]['sys_name']) }}">
                                <i data-feather="{{$item['icon']}}"></i>
                                <span>{{$item['name']}}</span>
                            </a>
                        </li>
                    @endif
                @else
                    <li class="treeview {{ $prefix == $item['prefix'] ? 'active' : '' }}">
                        <a href="#">
                            <i data-feather="{{$item['icon']}}"></i>
                            <span>{{$item['name']}}</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-right pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            @foreach ($item['sys_methods'] as $key => $method)
                                @if ($method['is_menu'] === 1)
                                    <li class="{{ $route == $method['sys_name'] ? 'active' : '' }}">
                                        <a href="{{ route($method['sys_name']) }}">
                                            <i class="ti-more {{ $route == route('role.view') ? 'active' : '' }}"> </i>
                                            {{$method['name']}}
                                        </a>
                                    </li>
                                @endif
                            @endforeach
                        </ul>
                    </li>
                @endif
            @endforeach
        </ul>
    </section>

    <div class="sidebar-footer">
        <a href="javascript:void(0)" class="link" data-toggle="tooltip" title=""
            data-original-title="Settings" aria-describedby="tooltip92529"><i class="ti-settings"></i></a>
        <a href="mailbox_inbox.html" class="link" data-toggle="tooltip" title=""
            data-original-title="Email"><i class="ti-email"></i></a>
        <a href="javascript:void(0)" class="link" data-toggle="tooltip" title=""
            data-original-title="Logout"><i class="ti-lock"></i></a>
    </div>
</aside>
