<nav class="navbar navbar-expand-md navbar-light navbar-laravel bg-primary cantarell">
    <div class="container-fluid">
        <div class="col-md-1">
            <a class="" href="{{ url('/') }}">
                <img src="{{ asset('images/logo.png') }}" class="" alt="" width="100%">
            </a>
        </div>
        
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="{{ __('Toggle navigation') }}">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <!-- Left Side Of Navbar -->
            <ul class="navbar-nav mr-auto">
                <li class="nav-item px-3">
                    <a class="nav-link text-white font-weight-bold" href="/module-achat">ACHAT</a> 
                </li>
                <li class="nav-item px-3">
                    <a class="nav-link text-white font-weight-bold" href="/module-vente">PRODUCTION</a>
                </li>
                {{-- <li class="nav-item px-3">
                    <a class="nav-link disabled text-white font-weight-bold" href="/module-production">PRODUCTION</a>
                </li> --}}
                <li class="nav-item px-3">
                    <a class="nav-link text-white font-weight-bold" href="/module-distribution">DISTRBUTION</a>
                </li>
                
                <li class="nav-item px-3">
                    <a class="nav-link text-white font-weight-bold" href="/module-inventaire">STOCK</a>
                </li>
            </ul>
            <!-- Right Side Of Navbar -->
            <ul class="navbar-nav ml-auto ">
                <!-- Authentication Links -->
                @guest
                    <li class="nav-item">
                        <a class="nav-link text-white font-weight-bold" href="{{ route('login') }}">{{ __('LOGIN') }}</a>
                    </li>
                    {{-- <li class="nav-item">
                        <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
                    </li> --}}
                @else
                    <li class="nav-item dropdown">
                        <a id="navbarDropdown" class="nav-link dropdown-toggle text-white font-weight-bold" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                            {{ Auth::user()->name }} <span class="caret"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="{{ route('logout') }}"
                               onclick="event.preventDefault();
                                             document.getElementById('logout-form').submit();">
                                {{ __('Logout') }}
                            </a>
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                @csrf
                            </form>
                        </div>
                    </li>
                @endguest
            </ul>
        </div>
    </div>
</nav>