<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBonCommandesProduitBases extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bon_commandes_produit_bases', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('bon_commande_id');
            $table->unsignedInteger('produit_base_id');
            $table->unsignedInteger('quantité');
            $table->double('prix_unitaire')->nullable();
            $table->double('prix_total')->nullable();

            $table->double('coût_unitaire')->nullable();
            $table->double('coût_total')->nullable();
            $table->foreign('produit_base_id')->references('id')->on('produit_bases')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('bon_commande_id')->references('id')->on('bon_commandes')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::dropIfExists('bon_commandes_produit_bases');
        Schema::enableForeignKeyConstraints();
    }
}
