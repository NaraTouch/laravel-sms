<?php

namespace App\Providers;
use Illuminate\Support\Facades\Blade;
use Illuminate\Support\ServiceProvider;

class BladeDirectiveProvider extends ServiceProvider
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
        Blade::directive('feature', function ($expression) {
            $session = session('_session')['permission'];
            list($routeName, $element) = explode('@', $expression);
            if (in_array($routeName, $session)) {
                return $element;
            }
        });
    }
}
