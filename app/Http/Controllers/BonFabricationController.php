<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\BonFabrication;
use App\ProduitBF;
use App\DemandeFabrication;
use App\Stock;
use DB;


class BonFabricationController extends Controller
{
    public function all(){
        return BonFabrication::all();
    }
    public function créerBonFabrication()
    {
        return view('vente.créer-bon-fabrication');
    }
    public function enregistreLeBon(Request $request)
    {
        $request->validate([
            'client_id' => 'required|integer',
            'observation' => 'required'
        ]);
        $bf = BonFabrication::create($request->all());
        $bf->numeroFacture();
        return $bf;
    }
    public function afficheLeBon(BonFabrication $bonFabrication)
    {
        $bonFabrication->loadMissing('produits');
        return view('vente.voir-bon-fabrication', compact('bonFabrication'));
    }
    public function créerNouveauBonFabrication(Request $request)
    {
        
        $bon = BonFabrication::create([
            'demande_fabrication_id' => $request->id,
            'client_id' => $request->client_id,
        ]);
        $bon->numeroFacture();
        if($bon){
            DemandeFabrication::find($request->id)->update([
                'état' => 'Bon de Fabrication Créé'
            ]);
            return $bon;
        }
    }
    public function ajoutePb(Request $request, BonFabrication $bon)
    {
        DB::table('bon_fabrications_produit_bases')->insert($request->all());
        $bon->update([
            'état' => 'Enregistré',
            'enregistré' => 1
        ]);
    }
    public function répertoire()
    {
        return view('vente.dossier-bon-fabrication');
    }
    public function enregistrerLesFrais(Request $request, BonFabrication $bon){
        $bon->update([
            'main_d_oeuvre' => $request->mainDOeuvre,
            'sous_traitance' => $request->sousTraitance,
            'charges_diverses' => $request->chargesDiverses
        ]);
        $this->produire($bon);
    }
    public function produire(BonFabrication $bon)
    {
        // Diminuer les stocks du bon utilisé
        $bon->loadMissing('produits');
        $coût_production_unitaire = 0;
        $coût_production_total = 0;
        foreach($bon->produits as $produit){
            // Crée une entrée dans la table stock pour enregistrer la sortie des produits de Base
            $stock = Stock::create([
                'stockable_id' => $produit->id,
                'stockable_type' => 'App\ProduitBase',
                'sortie' => $produit->pivot->quantité,
                'coût_vente_unitaire' => $produit->cump,
                'coût_vente_total' => $produit->cump * $produit->pivot->quantité
            ]);
            // Additionne le coût unitaire et total de production
            $coût_production_unitaire += $produit->cump;
            $coût_production_total += $produit->cump * $produit->pivot->quantité;
            // Calcule la nouvelle quantité présente de produits de base
            $entrées = Stock::where(['stockable_id' => $produit->id, 'stockable_type' => 'App\ProduitBase'])->sum('entrée');
            $sorties = Stock::where(['stockable_id' => $produit->id, 'stockable_type' => 'App\ProduitBase'])->sum('sortie');
            $quantité = $entrées - $sorties;
            // Mets à jour la quantité du produit de base
            $stock->stockable->update([
                'quantité' => $quantité,
                'valeur' => $quantité * $stock->stockable->cump
            ]);
            
        }
        $coût_production_total += ( $bon->main_d_oeuvre + $bon->sous_traitance + $bon->charges_diverses );
        // Augmenter les stocks de la demande
        foreach($bon->demande->produits as $produit){
            $cmp = ( $produit->valeur + $coût_production_total ) / ( $produit->quantité + $produit->pivot->quantité); 
            $stock = Stock::create([
                'stockable_id' => $produit->id,
                'stockable_type' => 'App\ProduitFini',
                'entrée' => $produit->pivot->quantité,
                'coût_production_unitaire' => $coût_production_total / $produit->pivot->quantité,
                'coût_production_total' => $coût_production_total
            ]);

            $entrées = Stock::where(['stockable_id' => $produit->id, 'stockable_type' => 'App\ProduitFini'])->sum('entrée');
            $sorties = Stock::where(['stockable_id' => $produit->id, 'stockable_type' => 'App\ProduitFini'])->sum('sortie');
            $quantité = $entrées - $sorties;

            
            // $cmp = Stock::where(['stockable_id' => $produit->id, 'stockable_type' => 'App\ProduitFini'])->avg('coût_production_unitaire');
            
            $stock->stockable->update([
                'quantité' => $quantité,
                'cpm' => $cmp,
                'valeur' => $quantité * $cmp
            ]);
        }
        $bon->update([
            'état' => "Produit"
        ]);
        return redirect('/module-fabrication/dossier-bon-fabrication');
    }
}
