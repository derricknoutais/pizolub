<?php

namespace App\Http\Middleware;
use Auth;
use Closure;

class DAF
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
        if(Auth::user()->role != 'DAF' ){
            return redirect('/login');
        }
        return $next($request);
    }
}
