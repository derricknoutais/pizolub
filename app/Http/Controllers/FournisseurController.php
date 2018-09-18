<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Fournisseur;
class FournisseurController extends Controller
{
    public function all(){
        return Fournisseur::all();
    }
}
