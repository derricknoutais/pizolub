@extends('layouts.app') 
@section('content')
<div class="container">
    <h2 class="my-5 text-center"> MODULE DISTRIBUTION </h2>
    <div class="row justify-content-center">
        <div class="col-md-4 mt-2">
            <a href="/module-distribution/créer-bon-distribution">
                <div class="card h-100 text-center d-flex bg-primary">
                    <div class="card-header mt-3 flex-fill">
                        <img class="card-img-top text-center" src="{{ asset('illustrations/créer-demande-achat.svg') }}" style="width:30%">
                    </div>
                    <div class="card-body">
                        <h4 class="card-title text-center text-light">Créer Bon de Distribution</h4>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-md-4 mt-2">
            <a href="/module-distribution/dossier-bon-distribution">
                <div class="card h-100 text-center d-flex bg-primary ">
                    <div class="card-header mt-3">
                        <img class="card-img-top text-center" src="{{ asset('illustrations/dossier-demande-achat.svg') }} " style="width:30.1%">
                    </div>

                    <div class="card-body">
                        <h4 class="card-title text-center text-light ">Dossiers Bons Distribution</h4>
                    </div>
                </div>
            </a>

        </div>

    </div>
</div>
@endsection