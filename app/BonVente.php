<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BonVente extends Model
{
    protected $guarded = [];
    
    public function numeroFacture()
    {
        $count = BonVente::count();

        if($count < 10){
            $count = "00" . $count;
        } else if($count < 100){
            $count = "0" . $count;
        } 
        $this->update([
            'numéro' => 'BV' . $count . '/' . date('Y')
        ]);

    }
}
