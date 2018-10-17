<template>
<div>
    <div class="progress" v-if="isLoading" style="height: 15px;" >
        <div ref="progressBar" class="progress-bar bg-primary" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">{{ progressValue }}%</div>
    </div>
    <div class="container">
        <en-tete></en-tete>
        <notifications group="foo" position="top left" classes="vue-notification mt-2 ml-1" width="20%"/>
        <h2 class="text-center text-secondary mt-5">DEMANDE D'ACHAT Nº {{ data.numero }}</h2>

        <imprimer :isLoading="isLoading" :data="data" v-if=" data.enregistré">
            <button v-if="data.état !== 'Bon de Commande Créé' && data.état !== 'Bon Commande Envoyé' && data.état !== 'Stock Reçu'"  type="button" class="btn text-light btn-info" :class="data.état === 'B.C Créé'? 'disabled' : ''" data-toggle="modal" :data-target="data.état === 'B.C Créé'? '#no' : '#login'"><i class="mx-1" :class="isLoading ? 'fa fa-spinner fa-spin' : 'fas fa-edit' "></i>Modifier la demande</button>
        </imprimer>
        <div>
            <p>Nom Client:</p>
        </div>
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
        <div class="modal fade" ref="login" id="no" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 style="margin: 0 auto"><i class=" mx-1 fas fa-exclamation-triangle fa-3x text-danger" ></i></h5>
                    </div>
                    <div class="modal-body text-center">
                        <h3 class="mb-4 mt-3">Modification Impossible</h3>
                        <p>Désolé! Cette demande a été déjà commandée. Aucune modification ne peut être apportée à ce document!</p>
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Ok</button>
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
        <div class="row mt-4">
            <div class="col-md-12">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Nom du Produit</th>
                            <th>Quantité (kG)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(row,index) in rows">
                            <td scope="row">{{ row.nom }}</td>
                            <td>
                                <input v-if="editing && ! isLoading" :id="index" :value="row.pivot.quantité"> 
                                <input v-else-if="editing && isLoading" :value="toModify[index].quantité">
                                <span v-else>{{ row.pivot.quantité }}</span>
                            </td>
                            <td class="no-border">
                                <a v-if="! data.enregistré" @click="removeRow(index)" class="text-danger">
                                    <i class="fas fa-trash"></i>
                                </a>
                                <a v-if="editing === true" @click="removeItem(row.pivot.id)" class="text-danger">
                                    <i class="fas fa-trash"></i>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="form-group col-md-12 text-center mt-5" v-if="! data.enregistré">
                <button @click="postRequest" class="btn btn-secondary text-light">Enregistrer<i class="mx-1" :class="isLoading ? 'fa fa-spinner fa-spin' : 'fas fa-save' "></i></button>
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
            progressValue: 0,
            toPost: [],
            email: "",
            password: "",
            editing : false,
            toModify: []
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
        removeItem(id){
            axios.get('/api/demande-achat/supprimer/' + id).then( response => {
                console.log(response.data)
            });
        },
        prepareData(){
            this.rows.forEach((each) =>{
                this.toPost.push({
                    demande_achat_id : this.data.id,
                    produit_base_id : each.id,
                    quantité: each.pivot.quantité
                })
            });
        },
        postRequest(){
            this.isLoading = true
            this.prepareData()
            axios.post('/api/demande-achat/ajoute-pb/' + this.data.id, this.toPost).then((response) => {
                this.isLoading = true
                this.$notify({ group: 'foo', title: 'Succès',
                  type: 'success',
                  text: "Demande d'Achat Nº " + response.data.numero + " enregistré et envoyé avec succès",
                });
                var id = setInterval(this.progress, 35);
                setTimeout(() => {
                    window.location.replace("/module-achat/dossier-demande-achat/" + this.data.id); 
                }, 4500);
            })
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
            axios.post('/api/demande-achat/modifier', this.toModify ).then(response => {
                this.isLoading = true
                this.$notify({ group: 'foo', title: 'Succès',
                  type: 'success',
                  text: "Demande d'Achat Nº " + response.data.numero + " enregistré et envoyé avec succès",
                });
                var id = setInterval(this.progress, 35);
                setTimeout(() => {
                    window.location.reload(); 
                }, 4500); 
            });
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
                } else {
                    alert(response.data)
                }
            }).catch(error => {
                console.log(error);
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