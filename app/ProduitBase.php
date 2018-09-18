<?php

namespace App;
use App\FicheStock;
use Illuminate\Database\Eloquent\Model;

class ProduitBase extends Model
{
    protected $guarded = [];
    public $timestamps = false;

    public function fournisseur(){
        return $this->belongsTo(Fournisseur::class);
    }

    public function demandes(){
        return $this->belongsToMany(DemandeAchat::class, 'demande_achats_produit_bases', 'produit_base_id', 'demande_achat_id' );
    }

    public function bon_fabrication(){
        return $this->belongsToMany(BonFabrication::class, 'bon_fabrications_produit_bases', 'produit_base_id', 'bon_fabrication_id' );
    }
    public function stocks(){
        return $this->morphMany('App\Stock', 'stockable');
    }
}
