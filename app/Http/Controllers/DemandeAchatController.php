<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\DemandeAchat;
use App\BonCommande;
use App\DemandeProduit;
use Auth;
use DB;

class DemandeAchatController extends Controller
{
    public function modifier(Request $request){
        // return $request->all();
        foreach($request->all() as $req){
            DemandeProduit::find($req['id'])->update([
                'quantité' => $req['quantité']
            ]);
        }
    }
    public function supprimer(DemandeProduit $demandeProduit){
        $demandeProduit->delete();
    }

    public function all(){
        return $da = DemandeAchat::with('agent')->get();
    }
    public function index(){
        return view('achat.dossier-demande-achat');
    }
    public function store(Request $request){
        $valid = $request->validate([
            'type' => 'string|required',
            'fournisseur_id' => 'required|integer',
            'observation' => 'required|string',
            'motif' => 'required|string'
        ]);
        if($valid){
            $numero = DemandeAchat::numeroFacture($request->input('type'));
            $da = DemandeAchat::create([
                'type' => $request->input('type'),
                'fournisseur_id' => $request->input('fournisseur_id'),
                'observation' => $request->input('observation'),
                'motif' => $request->input('motif'),
                'numero' => $numero,
                'agent_id' => Auth::user()->id
            ]);
            if($da){
                return $da;
            }
        }

        
    }
    public function show(DemandeAchat $da){
        $da->loadMissing('produits');
        return view('achat.voir-demande-achat', compact('da'));
    }
    public function ajoutePb(Request $request, DemandeAchat $demande){
        DB::table('demande_achats_produit_bases')->insert($request->all());
        $demande->update([
            'état' => 'En Attente de Validation',
            'enregistré' => 1
        ]);
    }
    public function enCours(){
        return DemandeAchat::where(['validé' => 1, 'enregistré' => 1, 'état' => 'Validé'])->with('produits')->get();
    }
    public function valider(DemandeAchat $demandeAchat){
        $demandeAchat->update([
            'validé' => 1,
            'état' => 'Validé'
        ]);
    }

    
    
    
}
