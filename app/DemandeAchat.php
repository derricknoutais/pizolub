<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DemandeAchat extends Model
{
    protected $fillable = ['type', 'fournisseur_id', 'observation', 'agent_id', 'motif', 'numero', 'enregistré', 'état', 'validé'];

    public static function numeroFacture($type){
        $count = DemandeAchat::where('type', $type)->count() + 1;
        
        if($count < 10){
            $count = "00" . $count;
        } else if($count < 100){
            $count = "0" . $count;
        } 
        if($type == "Local"){
            return $numero =  "ACL" . $count . "/" . date('Y');
        } else if($type == "International"){
            return $numero =  "ACE" . $count . "/" . date('Y');
        }
        
    }
    public function produits(){
        return $this->belongsToMany(ProduitBase::class, 'demande_achats_produit_bases', 'demande_achat_id', 'produit_base_id')->withPivot('quantité', 'id');
    }
    public function agent()
    {
        return $this->belongsTo('App\User', 'agent_id');
    }
}
