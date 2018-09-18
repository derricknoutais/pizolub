<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProduitFini extends Model
{
    protected $guarded = [];
    public function client(){
        return $this->belongsTo(Client::class);
    }
    public function demandes(){
        return $this->belongsToMany(DemandeFarication::class, 'demande_fabrications_produit_finis', 'produit_fini_id', 'demande_fabrication_id' );
    }
    
    public function stocks(){
        return $this->morphMany('App\Stock', 'stockable');
    }
}
