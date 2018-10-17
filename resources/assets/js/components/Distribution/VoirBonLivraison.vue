<template>
<div>
    <div class="progress" v-if="isLoading" style="height: 15px;" >
        <div ref="progressBar" class="progress-bar bg-primary" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">{{ progressValue }}%</div>
    </div>
    <div class="container">
        <notifications group="foo" position="top left" classes="vue-notification mt-2 ml-1" width="20%"/>
        <en-tete></en-tete>
        <h1 class="text-center my-5">Bon de Livraison Nº{{ bon.numéro }}</h1>
        <imprimer :data="bon">
            <button v-if="bon.état !== 'Livré'"  type="button" class="btn text-light btn-info" :class="data.état === 'B.C Créé'? 'disabled' : ''" data-toggle="modal" :data-target="data.état === 'B.C Créé'? '#no' : '#login'"><i class="mx-1" :class="isLoading ? 'fa fa-spinner fa-spin' : 'fas fa-edit' "></i>Modifier la demande</button>
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
        <div class="row mt-5">
            <p class="col-md-4"><strong>Frais Transport: </strong>{{ bon.transport | currency }}</p>
            <p class="col-md-4"><strong>Frais Divers: </strong>{{ bon.divers | currency}}</p>
        </div>
        <div class="row mt-4">
            <div class="col-md-12">
                <table class="table table-striped ">
                    <thead>
                        <tr>
                            <th>Nom du Produit</th>
                            <th>Quantité Stockée</th>
                            <th>Quantité à Livrer</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(produit, index) in bon.demande.produits">
                            <td>{{ produit.nom }}</td>
                            <td>{{ produit.pivot.quantité }}</td>
                            <td>
                                <!-- <span v-if="bon.état !== 'Ouvert'">{{ bon.produits[index].pivot.quantité }}</span>
                                <input v-else type="number" :id="index"/> -->
                                <input v-if="bon.état === 'Ouvert' || (editing && ! isLoading)" :id="index" :value="bon.produits[index].quantité"> 
                                <input v-else-if="editing && isLoading" :value="data[index]">
                                <span v-else>{{bon.produits[index].pivot.quantité}}</span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="form-group col-md-12 text-center text-center mt-5" v-if="! bon.enregistré || editing === true">
                <button class="btn btn-secondary text-light" @click="enregistreLesQuantités()">Enregistrer Le Bon</button>
            </div>
        </div> 
    </div>
    
</div>
    
</template>
<script>
export default {
    props : ['bon', 'demande'],
    data(){
        return {
            data: [],
            isLoading: false,
            progressValue: 0,
            email: "",
            password: "",
            editing : false,
            toModify: []
        }
    },
    methods: {
        prepareData(){
            this.bon.produits.forEach((element, index) => {
                this.data.push(parseInt(document.getElementById(index).value));
            });
        },
        enregistreLesQuantités()
        {
            this.isLoading = true
            this.prepareData();
            axios.post('/api/bon-distribution/'+ 'ajouteLesQuantitésALivrer/' + this.bon.id , this.data).then(response => {
                this.isLoading = true
                this.$notify({ group: 'foo', title: 'Succès',
                  type: 'success',
                  text: "Demande d'Achat Nº " + response.data.numero + " enregistré et envoyé avec succès",
                });
                var id = setInterval(this.progress, 35);
                setTimeout(() => {
                    window.location.replace("/module-distribution/dossier-bon-distribution/" + this.bon.id); 
                }, 4500);
            }).catch(error => {
                console.log(error);
            });
        },
        checkLogs(){
            axios.post('/api/users/vérifieAccès', {email:this.email, password:this.password,type:'DC'}).then(response => {
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
        progress()
        {
            if(this.progressValue < 100){
                this.progressValue ++;
            }
            this.$refs.progressBar.style.width = this.progressValue + "%";
        }
        
    },
    mounted(){
    }

}
</script>
