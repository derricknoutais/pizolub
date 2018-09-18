<template>
<div>
    <div class="progress" v-if="isLoading" style="height: 15px;" >
        <div ref="progressBar" class="progress-bar bg-primary" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">{{ progressValue }}%</div>
    </div>
    <div class="container">
        <slot></slot>
        <notifications group="foo" position="top left" classes="vue-notification mt-2 ml-1" width="20%"/>

        <h2 class="text-center text-secondary">BON DE COMMANDE Nº {{ data.numero }} </h2>
        <!-- <button type="button" class="btn btn-danger text-light"data-toggle="modal" data-target="#login">Modifier la facture</button> -->
        <button type="button" class="btn btn-secondary text-light" data-toggle="collapse" data-target="#calculateur">Calculateur de Devises</button>
        
        <div class="collapse  fade" id="calculateur" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <label>Taux de la Devise</label>
                        <input type="number" class="form-control" v-model="devise">
                        <label>Montant à calculer</label>
                        <input type="number" class="form-control" v-model="montant">
                        <label>Résultat</label>
                        <input type="number" class="form-control" v-model="résultat" disabled>
                    </div>
                </div>
            </div>
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
        <div class="row mt-4">
            <div class="col-md-12">
                <table class="table table-striped ">
                    <thead>
                        <tr>
                            <th>Nom du Produit</th>
                            <th>Quantité (Kg)</th>
                            <th>Prix Unitaire (XAF)</th>
                            <th>Prix Total (XAF)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(produit, index) in produits">
                            <td>{{ produit.nom }}</td>
                            <td>{{ produit.pivot.quantité | numFormat }}</td>
                            <td>
                                <input v-if="data.état === 'En Cours' || editing === true"  :id="index" @keyup="calculeTotal(index, produit.pivot.quantité )" :placeholder="produit.pivot.prix_unitaire | currency" />
                                <span v-else>{{ produit.pivot.prix_unitaire | currency}}</span>
                            </td>
                            <td :id="'total' + index">
                                <span v-if="data.état === 'En Cours' || editing === true">{{ prix_total[index] | currency }}</span>
                                <span v-else>{{ produit.pivot.prix_total | currency }}</span>
                            </td>
                        </tr>
                        <tr class="font-weight-bold">
                            <td colspan="3" class="text-right">Total</td>
                            <td>{{ montant_total | currency }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="form-group col-md-12 text-center text-center mt-5" v-if="data.état === 'En Cours'">
                <button @click="ajouteLesPrix" class="btn btn-secondary text-light">Envoyer le Bon<i class="mx-1" :class="isLoading ? 'fa fa-spinner fa-spin' : 'fas fa-save' "></i></button>
            </div>
            <div class="form-group col-md-12 text-center text-center mt-5" v-if="editing">
                <button @click="editerLaCommande()" class="btn btn-secondary text-light">Modifier le Bon<i class="mx-1" :class="isLoading ? 'fa fa-spinner fa-spin' : 'fas fa-save' "></i></button>
            </div>
        </div> 
    </div>
</div>
    
</template>
<script>
export default {
    data(){
        return {
            email: "",
            password: "",
            editing : false,
            montant: 0,
            devise: 0,
            résultat: 0,
            montant_total: 0,
            produits : [],
            isLoading: false,
            prix_unitaire:[],
            prix_total: [],
            donnéesAEnvoyer: [],
            isLoading: false,
            progressValue: 0
        }
    },
    props: {
        data : {
            type: Object
        }
    },
    methods: {
        prepareData(){
            this.produits.forEach( (each, index) => {
                this.donnéesAEnvoyer.push({
                    id: this.data.id,
                    da_id: this.data.demande_achat_id,
                    bc_pb_id: each.pivot.id,
                    prix_unitaire: this.prix_unitaire[index],
                    prix_total: this.prix_total[index]
                })
            })
        },
        checkLogs(){
            axios.post('/api/users/vérifieAccès', {email:this.email, password:this.password}).then(response => {
                if(response.data === true){
                    $('#login').modal('hide')
                    this.editing = true; 
                }
            }).catch(error => {
                console.log(error);
            });
        },
        editerLaCommande(){
            this.donnéesAEnvoyer = [];
            this.prepareData();
            axios.post('/api/bon-commande/edit', this.donnéesAEnvoyer ).then(response => {
                // this.isLoading = true;
                // this.$notify({
                //   group: 'foo',
                //   title: 'Succès',
                //   type: 'success',
                //   text: "Bon de Commande Nº " + response.data.numero + " modifiée avec Succès",
                // });
                // var id = setInterval(this.progress, 35);
            }).catch(error => {
                console.log(error);
            });
        },
        ajouteLesPrix(){
            this.donnéesAEnvoyer = [];
            this.prepareData();
            axios.post('/api/bon-commande/ajouteLesPrix', this.donnéesAEnvoyer).then(response => {
                this.isLoading = true;
                this.$notify({
                  group: 'foo',
                  title: 'Succès',
                  type: 'success',
                  text: "Bon de Commande Nº " + response.data.numero + " En Course avec Succès",
                });
                var id = setInterval(this.progress, 35);
                setTimeout(() => {
                    window.location.replace("/module-achat/dossier-bon-commande/" + this.data.id); 
                }, 4500);
                
            }).catch(error => {
                console.log(error);
            });
        },
        calculeTotal(index, quantité){
            const pu = document.getElementById(index).value;
            this.prix_unitaire[index] = parseInt(pu);
            const total = pu * quantité;
            this.prix_total[index] = total
            // document.getElementById("total" + index).innerHTML = total 
            this.montantTotal();

        },
        montantTotal(){
            var total = 0;
            if(this.editing === true || this.data.état === 'En Cours'){
                this.prix_total.forEach(index => {
                    total += parseInt(index)
                }); 
            } else {
                this.produits.forEach( produit => {
                    total += parseInt(produit.pivot.prix_total)
                });
            }

            this.montant_total = parseInt(total);
        },
        progress(){
            if(this.progressValue < 100){
                this.progressValue ++;
            }
            this.$refs.progressBar.style.width = this.progressValue + "%";

        }
    },
    watch: {
        devise(){
            return this.résultat = this.montant * this.devise
        },
        montant(){
            return this.résultat = this.montant * this.devise
        },
    },
    mounted() {
        this.produits = this.data.produits
        this.montantTotal();
    }
}
</script>

