<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DemandeAchat extends Model
{
    protected $guarded = [];

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
        return $this->belongsToMany(ProduitBase::class, 'demande_achats_produit_bases', 'demande_achat_id', 'produit_base_id')->withPivot('quantité', 'id', 'pu_1', 'pt_1', 'cu_1', 'ct_1', 'pu_2', 'pt_2', 'cu_2', 'ct_2', 'pu_3', 'pt_3', 'cu_3', 'ct_3');
    }
    public function agent()
    {
        return $this->belongsTo('App\User', 'agent_id');
    }
}
