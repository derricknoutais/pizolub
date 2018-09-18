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
            $table->string('état');
            $table->double('transport')->nullable();
            $table->double('divers')->nullable();
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
