<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\DemandeAchat;
use App\BonCommande;
use DB;

class DemandeAchatController extends Controller
{
    public function all(){
        return $da = DemandeAchat::all();
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

        $numero = DemandeAchat::numeroFacture($request->input('type'));

        $da = DemandeAchat::create([
            'type' => $request->input('type'),
            'fournisseur_id' => $request->input('fournisseur_id'),
            'observation' => $request->input('observation'),
            'motif' => $request->input('motif'),
            'numero' => $numero
        ]);
        if($da){
            return $da;
        }
    }
    public function show(DemandeAchat $da){
        $da->loadMissing('produits');
        return view('achat.voir-demande-achat', compact('da'));
    }
    public function ajoutePb(Request $request, DemandeAchat $demande){
        DB::table('demande_achats_produit_bases')->insert($request->all());
        $demande->update([
            'enregistré' => 1
        ]);
    }
    public function enCours(){
        return DemandeAchat::where('état', 'En Cours')->with('produits')->get();
    }
    
    
}
