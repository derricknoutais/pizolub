<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBonFabricationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bon_fabrications', function (Blueprint $table) {
            $table->increments('id');
            $table->string('numéro')->nullable()->unique();
            $table->unsignedInteger('client_id');
            $table->unsignedInteger('agent_id')->nullable();
            $table->unsignedInteger('demande_fabrication_id');
            $table->enum('état', ['Ouvert', 'En Attente de Validation', 'Validé', 'Stock Fabriqué'])->default('Ouvert');
            $table->boolean('validé')->default(0);

            $table->boolean('enregistré')->default(0);
            $table->double('main_d_oeuvre')->nullable();
            $table->double('sous_traitance')->nullable();
            $table->double('charges_diverses')->nullable();
            $table->foreign('client_id')->references('id')->on('clients')->onDelete('cascade')->onUpdate('cascade');
            $table->foreign('demande_fabrication_id')->references('id')->on('demande_fabrications')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::dropIfExists('bon_fabrications');
    }
}
