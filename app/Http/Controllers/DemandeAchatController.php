<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\DemandeAchat;
use App\BonCommande;
use App\DemandeProduit;
use Auth;
use DB;

class DemandeAchatController extends Controller
{
    public function modifier(Request $request){
        // return $request->all();
        foreach($request->all() as $req){
            DemandeProduit::find($req['id'])->update([
                'quantité' => $req['quantité']
            ]);
        }
    }
    public function supprimer(DemandeProduit $demandeProduit){
        $demandeProduit->delete();
    }

    public function all(){
        return $da = DemandeAchat::with('agent')->get();
    }
    public function index(){
        return view('achat.dossier-demande-achat');
    }
    public function store(Request $request){
        $valid = $request->validate([
            'type' => 'string|required',
            'fournisseur_id' => 'required|integer',
            'observation' => 'required|string',
            'motif' => 'required|string'
        ]);
        if($valid){
            $numero = DemandeAchat::numeroFacture($request->input('type'));
            $da = DemandeAchat::create([
                'type' => $request->input('type'),
                'fournisseur_id' => $request->input('fournisseur_id'),
                'observation' => $request->input('observation'),
                'motif' => $request->input('motif'),
                'numero' => $numero,
                'agent_id' => Auth::user()->id
            ]);
            if($da){
                return $da;
            }
        }

        
    }
    public function show(DemandeAchat $da){
        $da->loadMissing('produits');
        return view('achat.voir-demande-achat', compact('da'));
    }
    public function ajoutePb(Request $request, DemandeAchat $demande){
        DB::table('demande_achats_produit_bases')->insert($request->all());
        $demande->update([
            'état' => 'En Attente de Validation',
            'enregistré' => 1
        ]);
    }
    public function enCours(){
        return DemandeAchat::where(['validé' => 1, 'enregistré' => 1, 'état' => 'Validé'])->with('produits')->get();
    }
    public function valider(DemandeAchat $demandeAchat){
        $demandeAchat->update([
            'validé' => 1,
            'état' => 'Validé'
        ]);
    }

    public function créerSimulation(Request $request){
        DB::transaction(function () use ($request) {
            $demande = DemandeAchat::find($request[0]['id']);
            $douane = $request[0]['douane'];
            $trans = $request[0]['transport'];
            $autre = $request[0]['autre'];

            $frais_unitaire = ($douane + $trans + $autre) / $request[0]['quantité_totale'];

            if($demande->nombre_simulation == 0){
                DemandeAchat::find($request[0]['id'])->update([
                    'frais_douane1' => $douane,
                    'frais_transport1' => $trans,
                    'frais_autres1' => $autre,
                    'nombre_simulation' => 1,
                    'total_simulation1' => $request[0]['montant_total']
                ]);
                foreach($request->all() as $req){
                    DemandeProduit::find($req['da_pb_id'])->update([
                        'pu_1' => $req['prix_unitaire'],
                        'pt_1' => $req['prix_total'],
                        'cu_1' => $req['prix_unitaire'] + $frais_unitaire,
                        'ct_1' => $req['prix_total'] + $frais_unitaire * $req['quantité'] 
                    ]);
                }
            } else if($demande->nombre_simulation == 1){
                DemandeAchat::find($request[0]['id'])->update([
                    'frais_douane2' => $douane,
                    'frais_transport2' => $trans,
                    'frais_autres2' => $autre,
                    'nombre_simulation' => 2,
                    'total_simulation2' => $request[0]['montant_total']
                ]);
                foreach($request->all() as $req){
                    DemandeProduit::find($req['da_pb_id'])->update([
                        'pu_2' => $req['prix_unitaire'],
                        'pt_2' => $req['prix_total'],
                        'cu_2' => $req['prix_unitaire'] + $frais_unitaire,
                        'ct_2' => $req['prix_total'] + $frais_unitaire * $req['quantité'] 
                    ]);
                }
            } else if($demande->nombre_simulation == 2){
                DemandeAchat::find($request[0]['id'])->update([
                    'frais_douane3' => $douane,
                    'frais_transport3' => $trans,
                    'frais_autres3' => $autre,
                    'nombre_simulation' => 3,
                    'total_simulation3' => $request[0]['montant_total']
                ]);
                foreach($request->all() as $req){
                    DemandeProduit::find($req['da_pb_id'])->update([
                        'pu_3' => $req['prix_unitaire'],
                        'pt_3' => $req['prix_total'],
                        'cu_3' => $req['prix_unitaire'] + $frais_unitaire,
                        'ct_3' => $req['prix_total'] + $frais_unitaire * $req['quantité'] 
                    ]);
                }
            }
        });
    
    }
    
    
    
}
