<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */

    /*
    group will use as status data
    1. app : this module will show for user on none group section on side bar
    2. sys : this module will show for user on system setting group section on side bar
    2. repo : this module will show for user on report group section on side bar
    */
    public function up(): void
    {
        Schema::create('sys_modules', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('group')->default('app')->comment('app=(none group), sys=(system setting group), repo=(report group)');
            $table->text('description')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sys_modules');
    }
};
