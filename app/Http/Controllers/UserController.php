<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\User;
class UserController extends Controller
{
    public function vérifieAccès(Request $request){
        $user = User::where('email', $request->email)->first();
        if($user){
            if(Hash::check($request->password, $user->password )){
                return 'true';
            } else {
                return "Le mot de passe n'est pas correct!";
            }
        } else {
            return "Cet identifiant n'existe pas. Veuillez rentrer des informations valides!";
        }
        
        
    }
}
