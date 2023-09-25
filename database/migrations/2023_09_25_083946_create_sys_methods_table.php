<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('sys_methods', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->foreignId('module_id');
            $table->text('description')->nullable();
            $table->tinyInteger('is_menu')->default(1)->comment('0=hidden,1=show');
            $table->string('sys_name');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sys_methods');
    }
};
