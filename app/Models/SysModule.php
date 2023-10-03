<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SysModule extends Model
{
    use HasFactory;
    
    public function methods()
    {
        return $this->hasMany(SysMethod::class);
    }
}
