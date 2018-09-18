<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProduitDF extends Model
{
    protected $guarded = [];

    protected $table = 'demande_fabrications_produit_finis';
    public $timestamps = false;
    
}
