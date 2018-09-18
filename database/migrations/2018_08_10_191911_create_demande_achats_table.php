<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDemandeAchatsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('demande_achats', function (Blueprint $table) {
            $table->increments('id');
            $table->string('type');
            $table->string('numero')->nullable()->unique();
            $table->unsignedInteger('fournisseur_id');
            $table->text('observation');
            $table->text('motif');
            // $table->unsignedInteger('commande_id')->nullable();
            $table->unsignedInteger('agent_id')->nullable();
            $table->string('état')->default('En Cours');
            $table->boolean('enregistré')->default(0);

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
        Schema::disableForeignKeyConstraints();
        Schema::dropIfExists('demande_achats');
        Schema::enableForeignKeyConstraints();
    }
}
