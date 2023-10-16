<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Library\Services\Policy;
use App\Library\Services\Role;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Gate;
use Illuminate\Support\Str;

class Admin
{
    protected $Policy;
    protected $Role;

    public function __construct(Policy $policy, Role $role)
    {
        $this->Policy = $policy;
        $this->Role = $role;

    }
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if (!Auth::guard('admin')->check()) {
            return redirect()->route("admin.login")->with("alert", "Please login first.");
        }
        $allow = $this->Policy->Authorization($request);
        if (!$allow) {
            return abort(401, 'Unauthorized action.');
        }
        return $next($request);
    }
}
