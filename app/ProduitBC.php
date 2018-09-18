<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProduitBC extends Model
{
    protected $guarded = [];
    protected $table = "bon_commandes_produit_bases";

    public $timestamps = false;
}
