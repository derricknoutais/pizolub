<?php

namespace App\Http\Controllers;
use App\BonCommande;
use App\DemandeAchat;
use App\ProduitBC;
use DB;
use Illuminate\Http\Request;

class BonCommandeController extends Controller
{
    public function all(){
        return BonCommande::all();
    }
    public function créerNouveauBonCommande(Request $request){
        $numero = BonCommande::numeroFacture($request->type);
        $bon = BonCommande::create([
            'demande_achat_id' => $request->id,
            'fournisseur_id' => $request->fournisseur_id,
            'numero' => $numero,
            'type' => $request->type,
            'état' => 'En Cours'
        ]);
        if($bon){
            foreach ($request->produits as $produit) {
                ProduitBC::create([
                    'bon_commande_id' => $bon->id,
                    'produit_base_id' => $produit['id'],
                    'quantité' => $produit['pivot']['quantité']
                ]);
            }
            DemandeAchat::find($request->id)->update([
                'état' => 'Bon de Commande Créé'
            ]);
            return $bon;
        }
    }
    public function show(BonCommande $bc){
        $bc->loadMissing('produits');
        return view('achat.voir-bon-commande', compact('bc'));
    }
    public function ajouteLesPrix(Request $request){
        foreach ($request->all() as $req) {
            ProduitBC::find($req['bc_pb_id'])->update([
                'prix_unitaire' => $req['prix_unitaire'],
                'prix_total' => $req['prix_total'],
            ]);
        }  
        BonCommande::find($request[0]['id'])->update([
            'état' => 'Enregistré'
        ]);
        DemandeAchat::find($request[0]['da_id'])->update([
            'état' => 'Bon Commande Envoyé'
        ]); 
    }
    public function présenteLesCommandesAReçevoir(){
        return BonCommande::where('état', 'Envoyé')->get();
    }
    public function enregistrerLesFrais(Request $request, BonCommande $bc){
        $commande = $bc->update([
            'frais_douane' => $request->douane,
            'frais_transport' => $request->transport,
            'autres_frais' => $request->divers,
            'état' => 'Stock Reçu'
        ]);
        
        if($commande){
            $bc->ventile();
            $bc = BonCommande::find($bc->id);
            $bc->augmenteLesStocks();
            $bc->calculeLeCUMP();
        }
        foreach($bc->produits as $produit){
            if(isset($produit->quantité)){
                $produit->increment('quantité', $produit->pivot->quantité);
            } else {
                $produit->update([
                    'quantité' => $produit->pivot->quantité
                ]);
            }
            
            $produit->update([
                'valeur' => $produit->cump * $produit->quantité
            ]);
        }
        
        
    }
    public function edit(Request $request){
        $request->all();
        foreach($request->all() as $request){
            if(isset($request['prix_unitaire'])){
                ProduitBC::find($request['bc_pb_id'])->update([
                    'prix_unitaire' => $request['prix_unitaire'],
                    'prix_total' => $request['prix_total']
                ]);
            }
            
        }
    }
}
