@extends('layouts.app') 
@section('content')



<voir-bon-commande :data="{{ $bc }}">
    @include('partials.header')
</voir-bon-commande>
@endsection