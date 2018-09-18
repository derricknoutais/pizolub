<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDemandeFabricationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('demande_fabrications', function (Blueprint $table) {
            $table->increments('id');
            $table->string('numéro')->nullable()->unique();
            $table->unsignedInteger('client_id');
            $table->text('observation');
            // $table->unsignedInteger('bon_fabrication_id')->nullable();
            $table->unsignedInteger('agent_id')->nullable();
            $table->string('état')->default('En Cours');;
            $table->boolean('enregistré')->default(0);
            $table->foreign('client_id')->references('id')->on('clients')->onDelete('cascade')->onUpdate('cascade');
            // $table->foreign('bon_fabrication_id')->references('id')->on('bon_fabrications')->onDelete('cascade')->onUpdate('cascade');
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
        Schema::dropIfExists('demande_fabrications');
    }
}
