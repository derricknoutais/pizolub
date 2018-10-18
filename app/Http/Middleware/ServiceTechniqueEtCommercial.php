<?php

namespace App\Http\Middleware;

use Closure;
use Auth;
class ServiceTechniqueEtCommercial
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(Auth::user()->role != 'Service Commercial' && Auth::user()->role != 'Service Technique' && Auth::user()->role != 'DG' && Auth::user()->role != 'DAF' && Auth::user()->role != 'DT' && Auth::user()->role != 'DC'){
            return redirect('/login');
        }
        return $next($request);
    }
}
