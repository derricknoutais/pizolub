<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProduitBasesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('produit_bases', function (Blueprint $table) {
            $table->increments('id');
            $table->longText('nom');
            $table->enum('type',['Huile Base','Additif','Virole','PEHD']);
            $table->unsignedInteger('fournisseur_id')->nullable();
            $table->double('cump')->nullable();
            $table->double('quantité')->nullable()->default(0);
            $table->double('valeur')->nullable();

            $table->foreign('fournisseur_id')->references('id')->on('fournisseurs')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::dropIfExists('produit_bases');
        Schema::enableForeignKeyConstraints();
    }
}
