<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProduitBF extends Model
{
    protected $guarded = [];
    protected $table = "bon_fabrications_produit_bases";

    public $timestamps = false;
}
