<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DemandeProduit extends Model
{
    protected $guarded = [];
    public $timestamps = false;
    protected $table = 'demande_achats_produit_bases';
}
