<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Stock;
use App\ProduitFini;
use App\ProduitBase;
class StockController extends Controller
{
    public function voirStockProduitBase($type, $stock)
    {
        $stocks = NULL;
        
        if($type == 'Additif' || $type == 'Huile Base'){
            $stocks = Stock::where(['stockable_type' => 'App\ProduitBase', 'stockable_id' => $stock])->get();
            $produit = ProduitBase::find($stock);
        }
        return view('inventaire.stocks', compact('stocks', 'produit'));
    }
    public function voirStockProduitFini(ProduitFini $produit)
    {
        $stocks = Stock::where(['stockable_type' => 'App\ProduitFini', 'stockable_id' => $produit->id])->get();

        return view('inventaire.stocks-produit-fini', compact('stocks', 'produit'));
    }
}
