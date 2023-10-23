<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    //php artisan migrate --path=/database/migrations/2023_10_20_173437_create_academics_table.php

    public function up(): void
    {
        Schema::create('academics', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('class_id')->unsigned()->nullable();
            $table->integer('year_id')->unsigned()->nullable();
            $table->integer('group_id')->unsigned()->nullable();
            $table->integer('shift_id')->unsigned()->nullable();
            $table->string('name', 255)->nullable(false);
            $table->tinyInteger('status')->nullable(false)->default(0);
            $table->date('start_date')->nullable(false);
            $table->date('end_date')->nullable(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('academics');
    }
};
