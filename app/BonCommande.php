<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BonCommande extends Model
{
    protected $fillable = ['demande_achat_id', 'fournisseur_id', 'type', 'numero', 'état', 'frais_douane', 'frais_transport', 'autres_frais', 'coût_unitaire', 'coût_total', 'agent_id', 'enregistré', 'validé'];
    public function agent()
    {
        return $this->belongsTo('App\User', 'agent_id');
    }
    public function demande()
    {
        return $this->hasOne('App\DemandeAchat');
    }
    public function produits()
    {
        return $this->belongsToMany(ProduitBase::class, 'bon_commandes_produit_bases', 'bon_commande_id', 'produit_base_id')->withPivot('id', 'quantité', 'prix_unitaire', 'prix_total', 'coût_unitaire', 'coût_total');
    }
    public static function numeroFacture($type)
    {
        $count = BonCommande::where('type', $type)->count() + 1;
        
        if($count < 10){
            $count = "00" . $count;
        } else if($count < 100){
            $count = "0" . $count;
        } 
        if($type == "Local"){
            return $numero =  "BCL" . $count . "/" . date('Y');
        } else if($type == "International"){
            return $numero =  "BCE" . $count . "/" . date('Y');
        }
    }
    public function quantitéTotaleCommandée()
    {
        $total = 0;
        foreach($this->produits as $produit){
            $total += $produit->pivot->quantité;
        }
        return $total;
    }
    public function montantDeLaCommande()
    {
        $total = 0;
        foreach($this->produits as $produit){
            $total += $produit->pivot->prix_total;
        }
        return $total;
    }
    public function calculeFraisUnitaire()
    {
        $quantitéTotale = $this->quantitéTotaleCommandée();
        $montantDeLaCommande = $this->montantDeLaCommande();
        $frais_totaux = $this->frais_douane + $this->frais_transport + $this->autres_frais;
        return $frais_unitaire = $frais_totaux / $quantitéTotale;
    }
    public function ventile()
    {
        $frais_unitaire = $this->calculeFraisUnitaire();
        foreach($this->produits as $produit){
            $produit_bc = ProduitBC::find($produit->pivot->id);
            $produit_bc->update([
                'coût_unitaire' => $frais_unitaire + $produit_bc->prix_unitaire,
                'coût_total' => $produit_bc->quantité * $frais_unitaire + $produit_bc->prix_unitaire
            ]);
        }
    }
    public function augmenteLesStocks()
    {
        foreach($this->produits as $produit){
            Stock::create([
                'stockable_id' => $produit->id,
                'stockable_type' => 'App\ProduitBase',
                'entrée' => $produit->pivot->quantité,
                'coût_achat_unitaire' => $produit->pivot->coût_unitaire,
                'coût_achat_total' => $produit->pivot->coût_unitaire * $produit->pivot->quantité
            ]);
        }
    }
    public function calculeLeCUMP()
    {
        foreach($this->produits as $produit){
            $somme_coût_achat_total = Stock::where(['stockable_id' => $produit->id, 'stockable_type' => 'App\ProduitBase' ])
                ->sum('coût_achat_total');
            $somme_entrée = Stock::where(['stockable_id' => $produit->id, 'stockable_type' => 'App\ProduitBase' ])
            ->sum('entrée');
            $cump = $somme_coût_achat_total / $somme_entrée ;
            $latest = Stock::where(['stockable_id' => $produit->id, 'stockable_type' => 'App\ProduitBase' ])
            ->latest()->first()->update([
                'cump' => $cump
            ]);
            $produit->update([
                'cump' => $cump
            ]);
        }
        

    }
}
