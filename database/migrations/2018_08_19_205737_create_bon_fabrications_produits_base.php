<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBonFabricationsProduitsBase extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bon_fabrications_produit_bases', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedInteger('bon_fabrication_id');
            $table->unsignedInteger('produit_base_id');
            $table->unsignedInteger('quantité');
            
            $table->foreign('produit_base_id')->references('id')->on('produit_bases')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('bon_fabrication_id')->references('id')->on('bon_fabrications')->onDelete('cascade')->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('bon_fabrications_produit_bases');
    }
}
