<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Auth;

class BonFabrication extends Model
{
    protected $guarded = [];
    
    public function agent()
    {
        return $this->belongsTo('App\User', 'agent_id');
    }
    public function produits(){
        return $this->belongsToMany(ProduitBase::class, 'bon_fabrications_produit_bases', 'bon_fabrication_id', 'produit_base_id')->withPivot('quantité', 'id');
    }
    public function demande(){
        return $this->belongsTo(DemandeFabrication::class, 'demande_fabrication_id');
    }
    public function  numeroFacture()
    {
        $count = BonFabrication::count();

        if($count < 10){
            $count = "00" . $count;
        } else if($count < 100){
            $count = "0" . $count;
        } 
        $this->update([
            'agent_id' => Auth::user()->id, 
            'numéro' => 'BP' . $count . '/' . date('Y')
        ]);

    }
}
