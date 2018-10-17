<template>
<div>
    <div class="progress" v-if="isLoading" style="height: 15px;" >
        <div ref="progressBar" class="progress-bar bg-primary" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">{{ progressValue }}%</div>
    </div>
    <div class="container h-100">
        <notifications group="foo" position="top left" classes="vue-notification mt-2 ml-1" width="20%"/>
        <h1 class="text-center my-5">Créer Bon Distribution</h1>
        <div class="col-md-4 offset-md-4">
            <div class="form-group">
                <label for="">Sélection la D.F Pour Laquelle Vous Souhaitez créer un Bon de Livraison</label>
                <select name="type" id="" class="form-control" v-model="demandeSelectionnée">
                    <option :value="demande" v-for="demande in demande_achats">{{ demande.numéro }}</option>
                </select>
            </div>
        </div>
        <div class="col-md-8 offset-md-2 my-5 border py-3 bg-white">
            <h3 class="text-center">Aperçu</h3>
            <div class="scroller p-3">
                <table class="table table-bordered header-fixed">
                    <thead>
                        <tr>
                            <th>Nom du Produit</th>
                            <th>Quantité</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="produit in demandeSelectionnée.produits">
                            <td scope="row" >{{ produit.nom }}</td>
                            <td>{{ produit.pivot.quantité }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
        <div class="form-group text-center">
            <button class="btn btn-primary" @click="créeLeBon()">Créer Bon<i  class="mx-2" :class="isLoading ? 'fa fa-spinner fa-spin' : 'fas fa-save' "></i></button>
        </div>
    </div>
</div>
    
</template>
<script>
export default {
    data(){
        return {
            demande_achats:[],
            demandeSelectionnée: '',
            isLoading: false,
            progressValue : 0
        }
    },
    methods: {
        recupereLesDemandes(){
            axios.get('/api/demande-fabrication/all').then(response => {
                this.demande_achats = response.data
            });
            
        },
        créeLeBon(){
            axios.post('/api/bon-distribution/créerLeBon', this.demandeSelectionnée ).then(response => {
                this.isLoading = true;
                this.$notify({
                  group: 'foo',
                  title: 'Succès',
                  type: 'success',
                  text: "Bon de Livraison Nº " + response.data.numero + " créée avec Succès",
                });
                var id = setInterval(this.progress, 35);
                setTimeout(() => {
                    window.location.replace("/module-distribution/dossier-bon-distribution/" + response.data.id); 
                }, 4500);
            }).catch(error => {
                console.log(response.data);
            });
        },
        progress(){
            if(this.progressValue < 100){
                this.progressValue ++;
            }
            this.$refs.progressBar.style.width = this.progressValue + "%";

        }
    },
    mounted(){
        this.recupereLesDemandes()
    }

}
</script>
<style>
.scroller {
    display: block;
    max-height: 45vh !important;
    overflow-y: auto;
    overflow-x: auto;
    -ms-overflow-style: -ms-autohiding-scrollbar;
}
.header-fixed {
    width: 100% 
}

.header-fixed > thead,
.header-fixed > tbody,
.header-fixed > thead > tr,
.header-fixed > tbody > tr,
.header-fixed > thead > tr > th,
.header-fixed > tbody > tr > td {
    display: block;
}

.header-fixed > tbody > tr:after,
.header-fixed > thead > tr:after {
    content: ' ';
    display: block;
    visibility: hidden;
    clear: both;
}

.header-fixed > tbody {
    overflow-y: auto;
    height: 35vh;
}

.header-fixed > tbody > tr > td,
.header-fixed > thead > tr > th {
    width: 50%;
    float: left;
}
</style>
