
    <div class="row">
        <div class="col-md-3">
            <img src="/images/logo.png" class="img-fluid">
        </div>
        <div class="col-md-6">
            @yield('title')
        </div>
        
        <div class="col-md-3">
            <p class="text-right">{{\Carbon\Carbon::today()->format('d-M-Y')}}</p>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <p><i class="fas fa-envelope"></i> B.P: 699</p>
            <p><i class="fas fa-map-marker"></i> Ville: Port-Gentil</p>
            <p><i class="fas fa-phone"></i> Tél: 55.28.40</p>
        </div>
    </div>