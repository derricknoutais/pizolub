<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\DemandeFabrication;
use App\ProduitDF;
use DB;
use Auth;

class DemandeFabricationController extends Controller
{
    public function index(){
        return view('vente.dossier-demande-fabrication');
    }
    public function all(){
        return DemandeFabrication::with(['produits', 'agent'])->get();
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
        $bf->update([ 'agent_id' => Auth::user()->id ]);
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
            'enregistré' => 1,
            'état' => 'En Attente de Validation'
        ]);
    }
    public function enCours(){
        return DemandeFabrication::where(['état' => 'Validé', 'validé' => 1])->with('produits')->get();
    }

    public function modifier(Request $request){
        // return $request->all();
        foreach($request->all() as $req){
            ProduitDF::find($req['id'])->update([
                'quantité' => $req['quantité']
            ]);
        }
    }
    public function valider(DemandeFabrication $demandeFabrication){
        $demandeFabrication->update([
            'validé' => 1,
            'état' => 'Validé'
        ]);
    }
}
