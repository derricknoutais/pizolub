<template>
<div>
    <div class="progress" v-if="isLoading" style="height: 15px;" >
        <div ref="progressBar" class="progress-bar bg-primary" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">{{ progressValue }}%</div>
    </div>
    <div class="container">
        <notifications group="foo" position="top left" classes="vue-notification mt-2 ml-1" width="20%"/>
        <en-tete></en-tete>
        <h2 class="text-center text-secondary mt-5">BON DE PRODUCTION Nº {{ data.numéro }}</h2>
        <imprimer :data="data">
            <button v-if="data.état !== 'Stock Fabriqué'" type="button" class="btn btn-info text-light"data-toggle="modal" data-target="#login"><i class="fas fa-edit mx-1"></i>Modifier la facture</button>
        </imprimer>
        <div class="modal fade" ref="login" id="login" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">CONNEXION</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group row">
                            <label for="email" class="col-sm-4 col-form-label text-md-right">Identifiant</label>
                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" v-model="email" required autofocus>
                            </div>
                        </div>
                        <div class="form-group row py-2">
                            <label for="password" class="col-md-4 col-form-label text-md-right">Mot de Passe</label>

                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control" v-model="password" required>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-primary" @click="checkLogs()">Se Connecter</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Annuler</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row my-3" v-if="! data.enregistré ">
            <div class="col-md-3">
                <v-select v-model="typeSelectionne" :options="typesProduits" placeholder="Selectionner un Type de Produit">
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
        <div class="row mt-5">
            <p class="col-md-4"><strong>Main d'Oeuvre: </strong>{{ data.main_d_oeuvre | currency }}</p>
            <p class="col-md-4"><strong>Sous Traitance: </strong>{{ data.sous_traitance | currency}}</p>
            <p class="col-md-4"><strong>Autres Frais: </strong>{{ data.charges_diverses | currency}}</p>
        </div>
        <div class="row mt-4">
            <div class="col-md-12">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Nom du Produit</th>
                            <th>Quantité</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(row,index) in rows">
                            <td scope="row">{{ row.nom }}</td>
                            <td>
                                <!-- {{ row.pivot.quantité }} -->
                                <input v-if="editing && ! isLoading" :id="index" :value="row.pivot.quantité"> 
                                <input v-else-if="editing && isLoading" :value="toModify[index].quantité">
                                <span v-else>{{ row.pivot.quantité }}</span>
                            </td>
                            <td class="no-border" v-if="! data.enregistré ">
                                <a @click="removeRow(index)"  class="text-danger"><i class="fas fa-trash"></i></a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="form-group col-md-12 text-center text-center mt-5" v-if="! data.enregistré">
                <button @click="postRequest" class="btn btn-secondary text-light">Envregistrer<i class="mx-1" :class="isLoading ? 'fa fa-spinner fa-spin' : 'fas fa-save' "></i></button>
            </div>
            <div class="form-group col-md-12 text-center mt-5" v-if="editing === true">
                <button @click="modifierDemande()" class="btn btn-danger text-light">Modifier<i class="mx-1" :class="isLoading ? 'fa fa-spinner fa-spin' : 'fas fa-edit' "></i></button>
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
                typesProduits: ['Virole', 'Huile Base', 'PEHD', 'Additif'],
                typeSelectionne: '',
                produitSelectionne: null,
                filtered: [], 
                quantite: 0,
                isLoading: false,
                editing: false,
                progressValue: 0,
                toPost: [],
                email: '',
                password: '',
                toModify: [],
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
                        bon_fabrication_id : this.data.id,
                        produit_base_id : each.id,
                        quantité: each.pivot.quantité
                    })
                });
            },
            postRequest(){
                this.isLoading = true
                this.prepareData()
                axios.post('/api/bon-fabrication/ajoute-pb/' + this.data.id, this.toPost).then((response) => {
                    this.isLoading = true
                    this.$notify({ group: 'foo', title: 'Succès',
                    type: 'success',
                    text: "Demande d'Achat Nº " + response.data.numero + " enregistré et envoyé avec succès",
                    });
                    var id = setInterval(this.progress, 35);
                    setTimeout(() => {
                        window.location.replace("/module-fabrication/dossier-bon-fabrication/" + this.data.id); 
                    }, 4500);
                })
            },
            progress(){
                if(this.progressValue < 100){
                    this.progressValue ++;
                }
                this.$refs.progressBar.style.width = this.progressValue + "%";
            },
            checkLogs(){
                axios.post('/api/users/vérifieAccès', {email:this.email, password:this.password,type:'DT'}).then(response => {
                    if(response.data === true){
                        $('#login').modal('hide')
                        this.editing = true; 
                    }
                }).catch(error => {
                    console.log(error);
                });
            },
            modifierDemande(){
                this.isLoading = true
                this.toPost = [];
                this.rows.forEach((element, index) => {
                    this.toModify.push({
                        id: element.pivot.id,
                        quantité: document.getElementById(index).value
                    });
                });
                axios.post('/api/bon-fabrication/modifier', this.toModify ).then(response => {
                    this.isLoading = true
                    this.$notify({ group: 'foo', title: 'Succès',
                    type: 'success',
                    text: "Demande de Fabrication Nº " + this.data.numéro + " modifié avec succès",
                    });
                    var id = setInterval(this.progress, 35);
                    setTimeout(() => {
                        window.location.reload(); 
                    }, 4500); 
                });
            },
        },
        watch:{
            typeSelectionne(){
                if(this.typeSelectionne === null){
                    this.filtered = this.produits;
                } else {
                    this.filtered = this.produits.filter( each => {
                        return each.type === this.typeSelectionne
                    });
                }
            }
        },
        mounted(){
            axios.get('/api/produit-base/all').then(response => {
                this.produits = response.data
                this.filtered = this.produits
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