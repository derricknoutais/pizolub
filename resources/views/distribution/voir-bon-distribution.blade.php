@extends('layouts.app')


@section('content')
    <voir-bon-distribution :bon="{{ $bonDistribution }}"></voir-bon-distribution>
@endsection