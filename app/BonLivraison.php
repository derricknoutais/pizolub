<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BonLivraison extends Model
{
    protected $guarded = [];

    public function produits(){
        return $this->belongsToMany(ProduitFini::class, 'bon_livraisons_produit_finis', 'bon_livraison_id', 'produit_fini_id')->withPivot('id', 'quantité');
    }
    public function demande()
    {
        return $this->belongsTo(DemandeFabrication::class, 'demande_fabrication_id');
    }
    public function  numeroFacture()
    {
        $count = BonLivraison::count();

        if($count < 10){
            $count = "00" . $count;
        } else if($count < 100){
            $count = "0" . $count;
        } 
        $this->update([
            'numéro' => 'BL' . $count . '/' . date('Y')
        ]);

    }
}
