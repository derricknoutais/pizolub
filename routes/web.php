<?php
Auth::loginUsingId(2);

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
            Route::get('all', 'UserController@all');
            Route::get('in-session', function(){
                return Auth::user();
            });
        });
        Route::prefix('client')->group(function(){
            Route::get('all', 'ClientController@all');
        });
        Route::prefix('demande-fabrication')->group(function(){
            Route::get('all', 'DemandeFabricationController@all');
            Route::get('en-cours', 'DemandeFabricationController@enCours');
            Route::post('créeUneDemande', 'DemandeFabricationController@enregistreLaDemande');
            Route::post('ajoute-pf/{demande}', 'DemandeFabricationController@ajoutePf');
            Route::post('/modifier', 'DemandeFabricationController@modifier');
            Route::get('valider/{demandeFabrication}', 'DemandeFabricationController@valider');
        });
        Route::prefix('bon-fabrication')->group(function(){
            Route::get('all', 'BonFabricationController@all');
            Route::post('créer', 'BonFabricationController@créerNouveauBonFabrication');
            Route::post('ajoute-pb/{bon}', 'BonFabricationController@ajoutePb');
            Route::get('{bon}/produire', 'BonFabricationController@produire');
            Route::post('{bon}/enregistrer-les-frais', 'BonFabricationController@enregistrerLesFrais');
            Route::post('modifier', 'BonFabricationController@modifier');
            Route::get('valider/{bonFabrication}', 'BonFabricationController@valider');
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
            Route::post('/modifier', 'DemandeAchatController@modifier');
            Route::get('supprimer/{demandeProduit}', 'DemandeAchatController@supprimer');
            Route::get('valider/{demandeAchat}', 'DemandeAchatController@valider');
        });
        Route::prefix('bon-commande')->group(function(){
            Route::post('créer', 'BonCommandeController@créerNouveauBonCommande');
            Route::post('ajouteLesPrix', 'BonCommandeController@ajouteLesPrix');
            Route::post('edit', 'BonCommandeController@edit');
            Route::get('all', 'BonCommandeController@all');
            Route::get('commande-a-recevoir', 'BonCommandeController@présenteLesCommandesAReçevoir');
            Route::post('{bc}/enregistrer-les-frais', 'BonCommandeController@enregistrerLesFrais');
            Route::get('valider/{bc}', 'BonCommandeController@valider');
        });
        Route::prefix('bon-distribution')->group(function(){
            Route::get('all', 'BonLivraisonController@all');
            Route::post('créerLeBon', 'BonLivraisonController@créeLeBon');
            Route::post('ajouteLesQuantitésALivrer/{bonLivraison}', 'BonLivraisonController@ajouteLesQuantitésALivrer');
            Route::post('{bonLivraison}/enregistrer-les-frais', 'BonLivraisonController@enregistrerLesFrais');
            Route::post('/modifier', 'BonLivraisonController@modifier');
            Route::get('valider/{bl}', 'BonLivraisonController@valider');
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
            Route::group(['middleware' => ['service.comptable.technique']], function () {
                Route::get('', function(){
                    return view('achat.index');
                });
            });
            Route::group(['middleware' => ['service.technique']], function () {
                
                Route::view('créer-demande-achat', 'achat.créer-demande-achat');
                Route::get('dossier-demande-achat', 'DemandeAchatController@index');
                Route::get('dossier-demande-achat/api', 'DemandeAchatController@all');
                Route::get('dossier-demande-achat/{da}', 'DemandeAchatController@show');
                Route::post('demande-achat', 'DemandeAchatController@store');
            });
            Route::group(['middleware' => ['service.comptable']], function () {
                Route::view('créer-bon-commande', 'achat.créer-bon-commande');
                Route::view('dossier-bon-commande', 'achat.dossier-bon-commande');
                Route::get('dossier-bon-commande/{bc}', 'BonCommandeController@show');
            });
        });

    
    
    /* 
    |--------------------------------------------------------------------------
    |                        Routes Pour Le Module Vente
    |--------------------------------------------------------------------------
    */
    Route::group(['middleware' => ['service.technique']], function () {
        Route::prefix('/module-fabrication')->group(function(){
            Route::get('créer-demande-fabrication', 'DemandeFabricationController@créerDemandeFabrication');
            Route::get('dossier-demande-fabrication/{demandeFabrication}', 'DemandeFabricationController@afficheLaDemande');
            Route::get('dossier-demande-fabrication', 'DemandeFabricationController@index');
            Route::get('créer-bon-fabrication', 'BonFabricationController@créerBonFabrication');
            Route::get('dossier-bon-fabrication/{bonFabrication}', 'BonFabricationController@afficheLeBon' );
            Route::get('dossier-bon-fabrication', 'BonFabricationController@répertoire' );
        });
        Route::view('/module-vente', 'vente.index'); 
        Route::view('/module-vente/dossier-bon-vente', 'vente.dossier-bon-vente');
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
    Route::get('/module-inventaire/matieres-premieres', function(){
        return view('inventaire.produit-fini');
    });

    /* 
    |--------------------------------------------------------------------------
    |                 Routes Pour Le Module Production
    |--------------------------------------------------------------------------
    */

    Route::group(['middleware' => ['service.commercial']], function () {
        Route::prefix('module-distribution')->group(function(){
            Route::view('/', 'distribution.accueil');
            Route::view('créer-bon-distribution', 'distribution.créer');
            Route::get('dossier-bon-distribution', 'BonLivraisonController@répertoire');
            Route::get('dossier-bon-distribution/{bonDistribution}', 'BonLivraisonController@afficherLeBon');
        });

        Route::prefix('bon-livraison')->group(function(){
            Route::get('créer/{demandeFabrication}', 'BonLivraisonController@créer')->where('demandeFabrication', '[0-9]+');
        });
    });
    Route::prefix('stock')->group(function(){
        Route::get('/produitfini/{produit}', 'StockController@voirStockProduitFini');
        Route::get('{type}/{stock}', 'StockController@voirStockProduitBase')->where('demandeFabrication', '[0-9]+');
    });

});
