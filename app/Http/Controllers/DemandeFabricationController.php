<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\DemandeFabrication;
use DB;

class DemandeFabricationController extends Controller
{
    public function index(){
        return view('vente.dossier-demande-fabrication');
    }
    public function all(){
        return DemandeFabrication::with('produits')->get();
    }
    public function créerDemandeFabrication()
    {
        return view('vente.créer-demande-fabrication');
    }
    public function enregistreLaDemande(Request $request)
    {
        $request->validate([
            'client_id' => 'required|integer',
            'observation' => 'required'
        ]);
        $bf = DemandeFabrication::create($request->all());
        $bf->numeroFacture();
        return $bf;
    }
    public function afficheLaDemande(DemandeFabrication $demandeFabrication)
    {
        $demandeFabrication->loadMissing('produits');
        return view('vente.voir-demande-fabrication', compact('demandeFabrication'));
    }
    public function ajoutePf(Request $request, DemandeFabrication $demande){
        DB::table('demande_fabrications_produit_finis')->insert($request->all());
        $demande->update([
            'enregistré' => 1
        ]);
    }
    public function enCours(){
        return DemandeFabrication::where('état', 'En Cours')->with('produits')->get();
    }
}
