@extends('layouts.app') 
@section('content')
<div class="container">
    <h2 class="mt-4 text-center"> MODULE PRODUCTION </h2>
    <div class="row justify-content-center">
        <div class="col-md-4 mt-2">
            <a href="/module-achat/créer-demande-achat">
                <div class="card h-100 text-center d-flex bg-primary">
                    <div class="card-head mt-3 flex-fill">
                        <img class="card-img-top text-center" src="{{ asset('illustrations/créer-bon-production.svg') }}" style="width:30%">
                    </div>

                    <div class="card-body">
                        <h4 class="card-title text-center text-light">Créer Bon de Production</h4>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4 mt-2">
            <a href="/module-achat/dossier-demande-achat">
                <div class="card h-100 text-center d-flex bg-primary ">
                    <div class="card-head mt-3">
                        <img class="card-img-top text-center" src="{{ asset('illustrations/folder.svg') }} " style="width:30.1%">
                    </div>

                    <div class="card-body">
                        <h4 class="card-title text-center text-light ">Dossiers Bons de Production</h4>
                    </div>
                </div>
            </a>

        </div>

    </div>
</div>
@endsection