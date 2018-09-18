@extends('layouts.app')

@section('content')
<div class="container">
    <h2 class="mt-4 text-center"> MODULE ACHAT </h2>
    <div class="row justify-content-center">
        <div class="col-md-4 mt-2">
            <a href="/module-achat/créer-demande-achat">
                <div class="card h-100 text-center d-flex bg-primary">
                    <div class="card-header mt-3 flex-fill">
                        <img class="card-img-top text-center" src="{{ asset('illustrations/créer-demande-achat.svg') }}" style="width:30%">
                    </div>
                    
                    <div class="card-body">
                        <h4 class="card-title text-center text-light">Créer Demande d'Achat</h4>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4 mt-2">
            <a href="/module-achat/dossier-demande-achat">
                <div class="card h-100 text-center d-flex bg-primary ">
                    <div class="card-header mt-3">
                        <img class="card-img-top text-center" src="{{ asset('illustrations/dossier-demande-achat.svg') }} " style="width:30.1%">
                    </div>

                    <div class="card-body">
                        <h4 class="card-title text-center text-light ">Dossiers Demande d'Achat</h4>
                    </div>
                </div>
            </a>
            
        </div>
        
    </div>
    <div class="row justify-content-center mt-3">
        <div class="col-md-4 mt-2">
            <a href="/module-achat/créer-bon-commande">
                <div class="card h-100 text-center bg-primary">
                    <div class="card-header mt-3" >
                        <img class="card-img-top text-center" src="{{ asset('illustrations/créer-bon-commande.svg') }}" style="width:30.1%">
                    </div>

                    <div class="card-body">
                        <h4 class="card-title text-center text-light ">Créer Bon de Commande</h4>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4 mt-2">
            <a href="/module-achat/dossier-bon-commande">
                <div class="card h-100 text-center bg-primary">
                    <div class="card-header mt-3" >
                        <img class="card-img-top text-center" src="{{ asset('illustrations/dossier-bon-commande.svg') }}" style="width:30.1%">
                    </div>
                    <div class="card-body">
                        <h4 class="card-title text-center text-light ">Dossiers Bon de Commande</h4>
                    </div>
                </div>
            </a>
        </div>
    </div>
</div>
@endsection