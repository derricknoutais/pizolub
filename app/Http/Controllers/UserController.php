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
                if($user->role == $request->type || $user->role == 'DG'){
                    return 'true';
                } else {
                    return "Désolé, vous n'avez pas les privilèges de modification." ;
                }
                
            } else {
                return "Le mot de passe n'est pas correct!";
            }
        } else {
            return "Cet identifiant n'existe pas. Veuillez rentrer des informations valides!";
        }
    }
    public function all(){
        return User::all();
    }
}
