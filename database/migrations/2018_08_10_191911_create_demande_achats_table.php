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
            $table->unsignedInteger('commande_id')->nullable();
            $table->unsignedInteger('agent_id');
            $table->enum('état', ['Ouvert', 'En Attente de Validation', 'Validé', 'B.C Créé', 'Stock Reçu'])->default('Ouvert');
            $table->boolean('enregistré')->default(0);
            $table->boolean('validé')->default(0);

            $table->integer('nombre_simulation')->default(0);

            $table->double('frais_douane1')->nullable();
            $table->double('frais_transport1')->nullable();
            $table->double('frais_autres1')->nullable();
            $table->double('total_simulation1')->nullable();

            $table->double('frais_douane2')->nullable();
            $table->double('frais_transport2')->nullable();
            $table->double('frais_autres2')->nullable();
            $table->double('total_simulation2')->nullable();

            $table->double('frais_douane3')->nullable();
            $table->double('frais_transport3')->nullable();
            $table->double('frais_autres3')->nullable();
            $table->double('total_simulation3')->nullable();
            
            

            
            
            

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
