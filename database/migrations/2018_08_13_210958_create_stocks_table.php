<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateStocksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stocks', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('stockable_id');
            $table->string('stockable_type');
            $table->unsignedInteger('entrée')->nullable();
            $table->unsignedInteger('sortie')->nullable();
            $table->double('coût_achat_unitaire')->nullable();
            $table->double('coût_achat_total')->nullable();
            $table->double('coût_vente_unitaire')->nullable();
            $table->double('coût_vente_total')->nullable();
            $table->double('coût_production_unitaire')->nullable();
            $table->double('coût_production_total')->nullable();
            $table->double('coût_distribution_unitaire')->nullable();
            $table->double('coût_distribution_total')->nullable();
            $table->double('cump')->nullable();

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
        Schema::dropIfExists('stocks');
    }
}
