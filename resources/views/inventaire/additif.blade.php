@extends('layouts.app')


@section('content')
    <inventaire-additif :data="{{ $inventaire }}" type="{{ $type }}"></inventaire-additif>
@endsection

