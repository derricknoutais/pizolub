@extends('layouts.app')


@section('content')
    <liste-stocks :stocks="{{ $stocks }}" :produit="{{ $produit }}"></liste-stocks>
@endsection

