@extends('layouts.app')

@section('content')
<div class="container">
    <div class="col-md-6 offset-md-3 text-center" style="margin-top:10em">
        <img src="{{ asset('images/logo.png') }}" class="img-fluid" width="70%">
    </div>
    <h1 class="text-center my-5">Bienvenue à Pizolub <span class=""> {{  Auth::user()->name }}</span></h1>
    {{-- <div class="row justify-content-center mt-3">           
        <div class="col-md-3">
            <a href="/module-achat/créer-demande-achat">
                <div class="card h-100 text-center d-flex bg-primary">
                    <div class="card-header mt-3 flex-fill">
                        <img class="card-img-top text-center" src="{{ asset('illustrations/créer-demande-achat.svg') }}" style="width:30%">
                    </div>

                    <div class="card-body">
                        <h4 class="card-title text-center text-light">Achat</h4>
                    </div>
                </div>
            </a>
        </div>

        <div class="col-md-3">
            <a href="/module-fabrication/créer-demande-fabrication">
                <div class="card h-100 text-center d-flex bg-primary ">
                    <div class="card-header flex-fill mt-3">
                        <img class="card-img-top text-center p-1" src="{{ asset('illustrations/créer-bon-production.svg') }} " style="width:33.1%" >
                    </div>
                    <div class="card-body">
                        <h4 class="card-title text-center text-light ">Production</h4>
                    </div>
                </div>
            </a> 
        </div>
        <div class="col-md-3">
            <a href="/module-fabrication/créer-demande-fabrication">
                <div class="card h-100 text-center d-flex bg-primary ">
                    <div class="card-header flex-fill mt-3">
                        <img class="card-img-top text-center p-1" src="{{ asset('illustrations/créer-bon-production.svg') }}" style="width:33.1%" >
                    </div>
                    <div class="card-body">
                        <h4 class="card-title text-center text-light ">Distribution</h4>
                    </div>
                </div>
            </a> 
        </div>

        <div class="col-md-3">
            <a href="/module-fabrication/dossier-demande-fabrication">
            <div class="card h-100 text-center d-flex bg-primary ">
                <div class="card-header">
                    <img class="card-img-top text-center" src="{{ asset('illustrations/dossier-bon-vente.svg') }} " style="width:45.8%">
                </div>

                <div class="card-body">
                    <h4 class="card-title text-center text-light ">Stock</h4>
                </div>
            </div>
            </a>
        </div>
    </div> --}}
    <div class="row justify-content-center">
        <ul class="nav nav-tabs|pills nav-stacked">
            <li class="nav-item">
                <a href="/module-achat" class="nav-link active">ACHAT</a>
            </li>
            <li class="nav-item">
                <a href="/module-vente" class="nav-link">PRODUCTION</a>
            </li>
            <li class="nav-item disabled">
                <a href="/module-distribution" class="nav-link">DISTRIBUTION</a>
            </li>
            <li class="nav-item disabled">
                <a href="/module-inventaire" class="nav-link">STOCK</a>
            </li>
        </ul>
    </div>
    
</div>
@endsection
