<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DemandeFabrication extends Model
{
    protected $guarded = [];

    public function produits()
    {
        return $this->belongsToMany(ProduitFini::class, 'demande_fabrications_produit_finis', 'demande_fabrication_id', 'produit_fini_id')
                    ->withPivot('quantité', 'id', 'quantité_restante');
    }

    public function client()
    {
        return $this->belongsTo( Client::class, 'client_id');
    }

    public function numeroFacture()
    {
        $count = DemandeFabrication::count();

        if ($count < 10)
        {
            $count = "00" . $count;
        } 
        else if ($count < 100)
        {
            $count = "0" . $count;
        } 
        $this->update( [ 'numéro' => 'DF' . $count . '/' . date('Y') ] );

    }
}
