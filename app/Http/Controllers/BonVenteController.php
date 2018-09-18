<?php

namespace App\Http\Controllers;

use App\BonVente;
use Illuminate\Http\Request;

class BonVenteController extends Controller
{
    public function créerBonVente()
    {
        return view('vente.créer-bon-vente');
    }
    public function enregistreLeBon(Request $request){
        $request->validate([
            'client_id' => 'required|integer',
            'observation' => 'required'
        ]);
        $bv = BonVente::create($request->all());
        $bv->numeroFacture();
    }
    public function afficheLeBon(BonVente $bonVente){
        return view('vente.voir-bon-vente', compact('bonVente'));
    }
    
}
