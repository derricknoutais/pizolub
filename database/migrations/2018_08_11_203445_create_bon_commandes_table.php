<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBonCommandesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bon_commandes', function (Blueprint $table) {
            $table->increments('id');
            $table->string('type');
            $table->string('numero')->unique();
            $table->unsignedInteger('agent_id')->nullable();
            $table->unsignedInteger('demande_achat_id');
            $table->unsignedInteger('fournisseur_id')->nullable();

            $table->boolean('approbation_daf')->default(0);
            $table->boolean('approbation_dg')->default(0);
            $table->string('état')->default('En Cours');

            $table->double('frais_douane')->default(0);
            $table->double('frais_transport')->default(0);
            $table->double('autres_frais')->default(0);

            $table->foreign('fournisseur_id')->references('id')->on('fournisseurs')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('agent_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('demande_achat_id')->references('id')->on('demande_achats')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::dropIfExists('bon_commandes');
    }
}
