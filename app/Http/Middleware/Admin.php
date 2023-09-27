<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Library\Services\Policy;

class Admin
{
    protected $Policy;
    public function __construct(Policy $policy)
    {
        $this->Policy = $policy;
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
            return redirect()->route("admin_login")->with("alert", "Please login first.");
        }
        $allow = $this->Policy->Authorization($request);
        if (!$allow) {
            return abort(401, 'Unauthorized action.');
        }
        return $next($request);
    }
}
