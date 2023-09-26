<?php

namespace App\Providers;
use Illuminate\Support\ServiceProvider;
use App\Library\Services\Role;
use App\Library\Services\Policy;

class RoleServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        $this->app->bind('App\Library\Services\Role', function ($app) {
            return new Role();
        });

        $this->app->bind('App\Library\Services\Policy', function ($app) {
            return new Policy();
        });
    }

}
