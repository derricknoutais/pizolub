<?php


Auth::routes();

/* 
|--------------------------------------------------------------------------
|                           Authentified Routes
|--------------------------------------------------------------------------
|
| Si tu n'es pas authentifié tu es redirigé vers la page Login 
|
*/

Route::group(['middleware' => ['auth']], function () {

    /* 
    |--------------------------------------------------------------------------
    |                    Routes API Pour Les Requêtes Ajax 
    |--------------------------------------------------------------------------
    */
    
    Route::prefix('api')->group(function(){

        Route::prefix('users')->group(function(){
            Route::post('vérifieAccès', 'UserController@vérifieAccès');
        });

        Route::prefix('client')->group(function(){
            Route::get('all', 'ClientController@all');
        });
        Route::prefix('demande-fabrication')->group(function(){
            Route::get('all', 'DemandeFabricationController@all');
            Route::get('en-cours', 'DemandeFabricationController@enCours');
            Route::post('créeUneDemande', 'DemandeFabricationController@enregistreLaDemande');
            Route::post('ajoute-pf/{demande}', 'DemandeFabricationController@ajoutePf');
        });

        Route::prefix('bon-fabrication')->group(function(){
            Route::get('all', 'BonFabricationController@all');
            Route::post('créer', 'BonFabricationController@créerNouveauBonFabrication');
            Route::post('ajoute-pb/{bon}', 'BonFabricationController@ajoutePb');
            Route::get('{bon}/produire', 'BonFabricationController@produire');
            Route::post('{bon}/enregistrer-les-frais', 'BonFabricationController@enregistrerLesFrais');
        });

        Route::prefix('produit-base')->group(function(){
            Route::get('all', 'ProduitBaseController@all');
        });

        Route::prefix('produit-finis')->group(function(){
            Route::get('all', 'ProduitFiniController@all');
            Route::get('inventaire', 'ProduitFiniController@inventaire');
        });

        Route::prefix('demande-achat')->group(function(){
            Route::get('en-cours', 'DemandeAchatController@enCours');
            Route::post('ajoute-pb/{demande}', 'DemandeAchatController@ajoutePb');
        });

        Route::prefix('bon-commande')->group(function(){
            Route::post('créer', 'BonCommandeController@créerNouveauBonCommande');
            Route::post('ajouteLesPrix', 'BonCommandeController@ajouteLesPrix');
            Route::post('edit', 'BonCommandeController@edit');
            Route::get('all', 'BonCommandeController@all');
            Route::get('commande-a-recevoir', 'BonCommandeController@présenteLesCommandesAReçevoir');
            Route::post('{bc}/enregistrer-les-frais', 'BonCommandeController@enregistrerLesFrais');
        });


        Route::prefix('bon-distribution')->group(function(){
            Route::get('all', 'BonLivraisonController@all');
            Route::post('créerLeBon', 'BonLivraisonController@créeLeBon');
            Route::post('ajouteLesQuantitésALivrer/{bonLivraison}', 'BonLivraisonController@ajouteLesQuantitésALivrer');
            Route::post('{bonLivraison}/enregistrer-les-frais', 'BonLivraisonController@enregistrerLesFrais');
        });


        Route::prefix('module-inventaire')->group(function(){
            Route::get('{type}', 'ProduitBaseController@allAdditifs')->where('name', '[A-Za-z]+');
        });

        Route::get('fournisseur/all', 'FournisseurController@all');
        


    });


    Route::get('/', function () {
        return view('accueil');
    });
    /* 
    |--------------------------------------------------------------------------
    |                       Routes Pour Le Module Achat
    |--------------------------------------------------------------------------
    */

    Route::prefix('module-achat')->group(function(){

        Route::get('', function(){
            return view('achat.index');
        });
        Route::get('créer-bon-commande', function(){
            return view('achat.créer-bon-commande');
        });
        Route::get('créer-demande-achat', function(){
            return view('achat.créer-demande-achat');
        });
        Route::get('dossier-demande-achat', 'DemandeAchatController@index');
        Route::get('dossier-demande-achat/api', 'DemandeAchatController@all');

        Route::get('dossier-bon-commande', function(){
            return view('achat.dossier-bon-commande');
        });
        Route::get('dossier-bon-commande/{bc}', 'BonCommandeController@show');

        Route::get('dossier-demande-achat/{da}', 'DemandeAchatController@show');

        Route::post('demande-achat', 'DemandeAchatController@store');
    });
    
    /* 
    |--------------------------------------------------------------------------
    |                        Routes Pour Le Module Vente
    |--------------------------------------------------------------------------
    */
    Route::prefix('/module-fabrication')->group(function(){
        Route::get('créer-demande-fabrication', 'DemandeFabricationController@créerDemandeFabrication');
        Route::get('dossier-demande-fabrication/{demandeFabrication}', 'DemandeFabricationController@afficheLaDemande');
        Route::get('dossier-demande-fabrication', 'DemandeFabricationController@index');
        Route::get('créer-bon-fabrication', 'BonFabricationController@créerBonFabrication');
        Route::get('dossier-bon-fabrication/{bonFabrication}', 'BonFabricationController@afficheLeBon' );
        Route::get('dossier-bon-fabrication', 'BonFabricationController@répertoire' );
    });
    Route::get('/module-vente', function(){
        return view('vente.index');
    }); 
    Route::get('/module-vente/dossier-bon-vente', function(){
        return view('vente.dossier-bon-vente');
    }); 

    /* 
    |--------------------------------------------------------------------------
    |                        Routes Pour Le Module Inventaire
    |--------------------------------------------------------------------------
    */

    Route::get('/module-inventaire', function(){
        return view('inventaire.index');
    });
    Route::get('/module-inventaire/huile-base', function(){
        return view('inventaire.huile-base');
    });
    Route::get('/module-inventaire/additifs', function(){
        return view('inventaire.additif');
    });
    Route::get('/module-inventaire/produits-finis', function(){
        return view('inventaire.produit-fini');
    });
    Route::get('/module-inventaire/virole', function(){
        return view('inventaire.produit-fini');
    });
    Route::get('/module-inventaire/pehd', function(){
        return view('inventaire.produit-fini');
    });
    Route::get('/module-inventaire/etiquette', function(){
        return view('inventaire.produit-fini');
    });
    Route::get('/module-inventaire/matieres-premieres    ', function(){
        return view('inventaire.produit-fini');
    });

    /* 
    |--------------------------------------------------------------------------
    |                 Routes Pour Le Module Production
    |--------------------------------------------------------------------------
    */

    Route::get('/module-production', function(){
        return view('production.index');
    });

    Route::prefix('module-distribution')->group(function(){
        Route::view('/', 'distribution.accueil');
        Route::view('créer-bon-distribution', 'distribution.créer');
        Route::get('dossier-bon-distribution', 'BonLivraisonController@répertoire');
        Route::get('dossier-bon-distribution/{bonDistribution}', 'BonLivraisonController@afficherLeBon');
    });

    Route::prefix('bon-livraison')->group(function(){
        Route::get('créer/{demandeFabrication}', 'BonLivraisonController@créer')->where('demandeFabrication', '[0-9]+');
    });
    Route::prefix('stock')->group(function(){
        Route::get('/produitfini/{produit}', 'StockController@voirStockProduitFini');
        Route::get('{type}/{stock}', 'StockController@voirStockProduitBase')->where('demandeFabrication', '[0-9]+');
    });

});
