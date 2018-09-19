@extends('layouts.app') 

@section('content')
    <div class="container">
        <h2 class="text-center mt-4">MODULE PRODUCTION</h2>
        <div class="row justify-content-center mt-3">           
            <div class="col-md-4">
                <a href="/module-fabrication/créer-demande-fabrication">
                    <div class="card h-100 text-center d-flex bg-primary ">
                        <div class="card-header flex-fill mt-3">
                            <img class="card-img-top text-center p-1" src="{{ asset('illustrations/créer-bon-production.svg') }} " style="width:33.1%" >
                        </div>
                        <div class="card-body">
                            <h4 class="card-title text-center text-light ">Créer Demande de Production</h4>
                        </div>
                    </div>
                </a> 
            </div>
            
            <div class="col-md-4">
                <a href="/module-fabrication/dossier-demande-fabrication">
                <div class="card h-100 text-center d-flex bg-primary ">
                    <div class="card-header">
                        <img class="card-img-top text-center" src="{{ asset('illustrations/dossier-bon-vente.svg') }} " style="width:45.8%">
                    </div>
            
                    <div class="card-body">
                        <h4 class="card-title text-center text-light ">Dossier Demande de Production</h4>
                    </div>
                </div>
                </a>
            </div>
        </div>
        <div class="row justify-content-center mt-4">
            <div class="col-md-4">
                <a href="/module-fabrication/créer-bon-fabrication">
                    <div class="card h-100 text-center d-flex bg-primary ">
                        <div class="card-header flex-fill mt-3">
                            <img class="card-img-top text-center" src="{{ asset('illustrations/fabrication.svg') }} " style="width:40.1%" >
                        </div>
                        <div class="card-body">
                            <h4 class="card-title text-center text-light ">Créer Bon Production</h4>
                        </div>
                    </div>
                </a>
                
            </div>

            <div class="col-md-4">
                <a href="/module-fabrication/dossier-bon-fabrication">
                <div class="card h-100 text-center d-flex bg-primary ">
                    <div class="card-header mt-3">
                        <img class="card-img-top text-center" src="{{ asset('illustrations/dossier-bon-vente.svg') }} " style="width:48.0%">
                    </div>
                    <div class="card-body">
                        <h4 class="card-title text-center text-light ">Dossier Bon Production</h4>
                    </div>
                </div>
                </a>
            </div>

        </div>
    </div>
@endsection