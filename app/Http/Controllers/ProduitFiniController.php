<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\ProduitFini;
use App\Stock;
class ProduitFiniController extends Controller
{
    public function all(){
        return ProduitFini::all();
    }
    public function inventaire(){
        return ProduitFini::with(['stocks', 'client'])->paginate(10);
    }
}
