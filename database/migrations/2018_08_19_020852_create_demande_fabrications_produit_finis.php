<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDemandeFabricationsProduitFinis extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('demande_fabrications_produit_finis', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('demande_fabrication_id');
            $table->unsignedInteger('produit_fini_id');
            $table->unsignedInteger('quantité');
            $table->unsignedInteger('quantité_restante')->nullable();
            $table->foreign('produit_fini_id')->references('id')->on('produit_finis')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('demande_fabrication_id', 'df_pf_demande_fabrication_id_foreign')->references('id')->on('demande_fabrications')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::dropIfExists('demande_fabrications_produit_finis');
        Schema::enableForeignKeyConstraints();
    }
}
