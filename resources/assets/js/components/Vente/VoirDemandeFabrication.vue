<template>
<div>
    <div class="progress" v-if="isLoading" style="height: 15px;" >
        <div ref="progressBar" class="progress-bar bg-secondary" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">{{ progressValue }}%</div>
    </div>
    <div class="container">
        <notifications group="foo" position="top left" classes="vue-notification mt-2 ml-1" width="20%"/>
        <h2 class="text-center text-secondary mt-5">DEMANDE DE FABRICATION Nº {{ data.numéro }}</h2>
        <!-- <a class="btn btn-danger text-light" :href="'/bon-livraison/créer/' + data.id">Créer Bon de Livraison</a> -->
        <div class="row my-3" v-if="! data.enregistré ">
            <div class="col-md-3">
                <v-select v-model="typeSelectionne" :options="clients" label="nom" placeholder="Filtrer par Client">
                    <template slot="no-options">Désolé! Aucun Résultat Trouvé!</template>
                </v-select>
            </div>
            <div class="col-md-6">

                <v-select v-model="produitSelectionne" :options="filtered" label="nom" placeholder="Selectionner un Produit">
                    <template slot="no-options">Désolé! Aucun Résultat Trouvé!</template>
                </v-select>
            </div>
            <div class="col-md-2">
                <input v-model="quantite" type="number" class="form-control form-control bg-transparent">
            </div>
            <div class="col-md-1" v-if="this.produitSelectionne !== null && this.quantite > 0">
                <a class="btn btn-secondary text-light"  drole="button" @click="addRow">Ajouter</a>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-md-12">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Nom du Produit</th>
                            <th>Quantité</th>
                            <th>Quantité Stockée</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(row,index) in rows">
                            <td scope="row">{{ row.nom }}</td>
                            <td contenteditable="true">{{ row.pivot.quantité }}</td>
                            <td class="no-border" v-if="! data.enregistré ">
                                <a @click="removeRow(index)"  class="text-danger"><i class="fas fa-trash"></i></a>
                            </td>
                            <td>{{ row.pivot.quantité_restante }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="form-group col-md-12 text-center text-center mt-5" v-if="! data.enregistré">
                <button @click="postRequest" class="btn btn-secondary text-light">Envoyer la Demande<i class="mx-1" :class="isLoading ? 'fa fa-spinner fa-spin' : 'fas fa-save' "></i></button>
            </div>
        </div> 
    </div>
</div>
    
</template>

<script>
export default {
    data(){
        return {
            rows: [],
            demande: {},
            produits:[],
            clients: [],
            typeSelectionne: '',
            produitSelectionne: null,
            filtered: [], 
            quantite: 0,
            isLoading: false,
            progressValue: 0,
            toPost: [],
        }
    },
    props: {
        data: {
            type: Object
        }
    },
    methods: {
        addRow(){
            if(this.produitSelectionne !== null && this.quantite > 0){
                var temp = Object.assign({}, this.produitSelectionne);
                temp.pivot = {
                    quantité : parseInt(this.quantite)
                }
                this.rows.push(temp)
            }
            
        },
        removeRow(index){
            this.rows.splice(index, 1);
        },
        prepareData(){
            this.rows.forEach((each) =>{
                this.toPost.push({
                    demande_fabrication_id : this.data.id,
                    produit_fini_id : each.id,
                    quantité: each.pivot.quantité,
                    quantité_restante: each.pivot.quantité
                })
            });
        },
        postRequest(){
            this.isLoading = true
            this.prepareData()
            axios.post('/api/demande-fabrication/ajoute-pf/' + this.data.id, this.toPost).then((response) => {
                this.isLoading = true
                this.$notify({ group: 'foo', title: 'Succès',
                  type: 'success',
                  text: "Demande d'Achat Nº " + response.data.numero + " enregistré et envoyé avec succès",
                });
                var id = setInterval(this.progress, 35);
                setTimeout(() => {
                    window.location.replace("/module-fabrication/dossier-demande-fabrication/" + this.data.id); 
                }, 4500);
            })
        },
        progress(){
            if(this.progressValue < 100){
                this.progressValue ++;
            }
            this.$refs.progressBar.style.width = this.progressValue + "%";
        }
    },
    watch:{
        typeSelectionne(){
            if(this.typeSelectionne === null){
                this.filtered = this.produits
                
            } else {
                this.filtered = this.produits.filter( each => {
                    return each.client_id === this.typeSelectionne.id
                });
            }
            
        }
    },
    mounted(){
        axios.get('/api/produit-finis/all').then(response => {
            this.produits = response.data
            this.filtered = this.produits
        });
        axios.get('/api/client/all').then(response => {
            this.clients = response.data
        });
        this.rows = this.data.produits
    }
}
</script>
<style>

.no-border{
      border: none!important;
}
</style>