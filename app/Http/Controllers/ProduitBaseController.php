<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ProduitBase;

class ProduitBaseController extends Controller
{
    public function all(){
        return ProduitBase::all();
    }
    public function allAdditifs($type){
        $inventaire = ProduitBase::where('type', $type)->with('fournisseur')->get();
        return view('inventaire.additif', compact('inventaire', 'type'));
    }
    
}
