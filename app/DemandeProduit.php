<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DemandeProduit extends Model
{
    protected $fillable = ['demande_achat_id', 'produit_base_id', 'quantité'];
    public $timestamps = false;
    protected $table = 'demande_achats_produit_bases';
}
