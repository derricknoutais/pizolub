<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Stock extends Model
{
    public $guarded = [];
    public function stockable(){
        return $this->morphTo();
    }
}
