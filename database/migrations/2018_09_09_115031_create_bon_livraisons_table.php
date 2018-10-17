<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBonLivraisonsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('bon_livraisons', function (Blueprint $table) {
            $table->increments('id');
            $table->string('numéro')->nullable();
            $table->unsignedInteger('demande_fabrication_id');
            $table->unsignedInteger('agent_id');
            $table->boolean('enregistré')->default(0);
            $table->enum('état', ['Ouvert', 'En Attente de Validation', 'Validé', 'Livré'])->default('Ouvert');
            $table->boolean('validé')->default(0);

            $table->double('transport')->nullable();
            $table->double('divers')->nullable();
            $table->foreign('agent_id')->references('id')->on('users')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::dropIfExists('bon_livraisons');
    }
}
