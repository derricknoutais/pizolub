<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class BonLivraisonsProduitFinis extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bon_livraisons_produit_finis', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('bon_livraison_id');
            $table->unsignedInteger('produit_fini_id');
            $table->integer('quantité')->nullable();
            $table->foreign('produit_fini_id')->references('id')->on('produit_finis')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('bon_livraison_id')->references('id')->on('bon_livraisons')->onDelete('cascade')->onUpdate('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bon_livraisons_produit_finis');
    }
}
