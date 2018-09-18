<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\DemandeFabrication;
use App\BonLivraison;
use App\ProduitBL;
use App\ProduitDF;
use App\Stock;
class BonLivraisonController extends Controller
{
    public function all()
    { 
        return $bons = BonLivraison::with(['demande', 'produits'])->get();
    }

    public function créer ()
    {
        return view('livraison.créer');
    }

    public function créeLeBon(Request $request)
    {


        $bonLivraison = BonLivraison::create([
            'demande_fabrication_id' => $request->id,
            'état' => 'En Cours'
        ]);
        $bonLivraison->numeroFacture();
        foreach($request->produits as $produit){
            ProduitBL::create([
                'bon_livraison_id' => $bonLivraison->id,
                'produit_fini_id' => $produit['id'],
            ]);
        }
        return $bonLivraison;
    }

    public function afficherLeBon(BonLivraison $bonDistribution)
    {
        $bonDistribution->loadMissing(['produits', 'demande.produits']);
        return view('distribution.voir-bon-distribution', compact('bonDistribution'));
    }

    public function répertoire()
    {
        $bons = BonLivraison::all();
        return view('distribution.dossier-bon-distribution');
    }

    public function voirBL(BonLivraison $bonLivraison)
    {
        $bonLivraison->loadMissing('produits');
        return view('livraison.créer', compact('demandeFabrication', 'bonLivraison'));
    }

    public function ajouteLesQuantitésALivrer(Request $request, BonLivraison $bonLivraison)
    {
        $bonLivraison->loadMissing(['produits', 'demande.produits']);
        // Ajouter les quantités dans le bon de livraison
        for($i = 0; $i < sizeof($bonLivraison->produits); $i++) {
            ProduitBL::find($bonLivraison->produits[$i]->pivot->id)->update([
                'quantité' => $request[$i]
            ]);
        }
            
        $bonLivraison->update([
            'état' => 'Enregistré'
        ]);
    }

    public function enregistrerLesFrais(Request $request, BonLivraison $bonLivraison)
    {
        $bonLivraison->loadMissing(['produits', 'demande.produits']);
         $bonLivraison->update([
            'transport' => $request->transport,
            'divers' => $request->divers
        ]);
        for($i = 0; $i < sizeof($bonLivraison->produits); $i++) {
            $quantité_totale = ProduitBL::where('bon_livraison_id', $bonLivraison->id)->sum('quantité');
            ProduitDF::find($bonLivraison->demande->produits[$i]->pivot->id)->decrement('quantité_restante', $bonLivraison->produits[$i]->pivot->quantité);
            $stock = Stock::create([
                'stockable_id' => $bonLivraison->produits[$i]->id,
                'stockable_type' => 'App\ProduitFini',
                'sortie' => $bonLivraison->produits[$i]->pivot->quantité,
                'coût_distribution_unitaire' => $bonLivraison->produits[$i]->cpm + (($bonLivraison->transport + $bonLivraison->frais) / $quantité_totale),
                'coût_distribution_total' => ($bonLivraison->produits[$i]->cpm + (($bonLivraison->transport + $bonLivraison->frais) / $quantité_totale)) * $bonLivraison->produits[$i]->pivot->quantité
            ]);
            $entrées = Stock::where(['stockable_id' => $bonLivraison->produits[$i]->id, 'stockable_type' => 'App\ProduitFini'])->sum('entrée');
            $sorties = Stock::where(['stockable_id' => $bonLivraison->produits[$i]->id, 'stockable_type' => 'App\ProduitFini'])->sum('sortie');
            $quantité = $entrées - $sorties;

            $stock->stockable->update([
                'quantité' => $quantité,
                'valeur' => $quantité * $stock->stockable->cpm
            ]);
        }
        $bonLivraison->update([
            'état' => 'Livré'
        ]);
    }
}
