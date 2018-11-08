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
            $table->integer('quantité');

            $table->double('pu_1')->nullable();
            $table->double('pt_1')->nullable();
            $table->double('cu_1')->nullable();
            $table->double('ct_1')->nullable();

            $table->double('pu_2')->nullable();
            $table->double('pt_2')->nullable();
            $table->double('cu_2')->nullable();
            $table->double('ct_2')->nullable();

            $table->double('pu_3')->nullable();
            $table->double('pt_3')->nullable();
            $table->double('cu_3')->nullable();
            $table->double('ct_3')->nullable();


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
