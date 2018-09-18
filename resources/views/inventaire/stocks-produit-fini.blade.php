@extends('layouts.app') 
@section('content')
    <liste-stocks-produit-fini :stocks="{{ $stocks }}" :produit="{{ $produit }}"></liste-stocks-produit-fini>
@endsection