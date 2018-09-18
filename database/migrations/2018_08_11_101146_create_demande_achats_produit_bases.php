<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDemandeAchatsProduitBases extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('demande_achats_produit_bases', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('demande_achat_id');
            $table->unsignedInteger('produit_base_id');
            $table->unsignedInteger('quantité');

            $table->foreign('produit_base_id')->references('id')->on('produit_bases')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('demande_achat_id')->references('id')->on('demande_achats')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::disableForeignKeyConstraints();
        Schema::dropIfExists('demande_achats_produit_bases');
        Schema::enableForeignKeyConstraints();
    }
}
