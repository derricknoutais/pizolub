<template>
<div>
    <div class="progress" v-if="isActive" style="height: 15px;" >
        <div ref="progressBar" class="progress-bar bg-secondary" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">{{ progressValue }}%</div>
    </div>

    <div class="container">
        <notifications group="foo" position="top left" classes="vue-notification mt-2 ml-1" width="20%"/>
        
        <h1 class="text-center my-5">Effectuer Demande Achat</h1>
        <div class="col-md-6 offset-md-3">
            <form method="POST" action="/demande-achat" @submit.prevent="storeForm">
                <div class="form-group">
                    <label for="">Type de la demande</label>
                    <select v-model="type" id="" class="form-control" :class="errors.type ? 'border-danger' : '' ">
                        <option value="Local" selected>Local</option>
                        <option value="International">International</option>
                    </select>
                    <small v-if="errors.type" v-for="typ in errors.type" class="text-danger">{{ typ }}</small>
                </div>

                <div class="form-group">
                    <label for="">Selectionner un fournisseur</label>
                    <select v-model="fournisseur_id" class="form-control" :class="errors.fournisseur_id ? 'border-danger' : '' ">
                        <option v-for="fournisseur in fournisseurs" :value="fournisseur.id">{{ fournisseur.nom }}</option>
                    </select>
                    <small v-if="errors.fournisseur_id" v-for="four in errors.fournisseur_id" class="text-danger">{{ four }}</small>
                </div>
                <div class="form-group">
                    <label for="">Observations</label>
                    <textarea v-model="observation" rows="3" class="form-control" :class="errors.observation ? 'border-danger' : '' "></textarea>
                    <small v-if="errors.observation" v-for="obs in errors.observation" class="text-danger">{{ obs }}</small>
                </div>


                <div class="form-group">
                    <label for="">Motif de la demande</label>
                    <textarea v-model="motif" rows="3" class="form-control" :class="errors.motif ? 'border-danger' : '' "></textarea>
                    <small v-if="errors.motif" v-for="mot in errors.motif" class="text-danger">{{ mot }}</small>
                </div>

                <div class="form-group text-center mt-5">
                    <button type="submit" class="btn btn-secondary text-white">Créer la Demande<i class="mx-1" :class="isActive ? 'fa fa-spinner fa-spin' : 'fas fa-save' "></i></button>
                </div>
            </form>
        </div>
    </div>
</div>
</template>

<script>
export default {
    data(){
        return {
            type: 'Local',
            fournisseur_id: 1,
            observation: '',
            motif: '',
            errors: {

            },
            isActive: false,
            progressValue: 0,
            fournisseurs: {}
        }
    },
    methods:{
        storeForm(){
            this.isActive = true;
            axios.post('/module-achat/demande-achat', {
                type: this.type,
                fournisseur_id: this.fournisseur_id,
                observation: this.observation,
                motif: this.motif
            }).then((response) => {
                this.errors = {}
                this.$notify({
                  group: 'foo',
                  title: 'Succès',
                  type: 'success',
                  text: "Demande d'Achat Nº " + response.data.numero + " créée avec Succès",
                });
                var id = setInterval(this.progress, 35);
                setTimeout(() => {
                    window.location.replace("/module-achat/dossier-demande-achat/" + response.data.id); 
                }, 3500);
                
            }).catch( (error) => {
                this.isActive = false;

                console.log(error.response.data)
                this.errors = error.response.data.errors;
            })
            
        },
        progress(){
            if(this.progressValue < 100){
                this.progressValue ++;
            }
            this.$refs.progressBar.style.width = this.progressValue + "%";
        }

    },
    mounted: function(){
       axios.get('/api/fournisseur/all').then(response => {
           this.fournisseurs = response.data;
           
       }).catch(error => {
           console.log(error);
       });
    }
}
</script>

<style>
.progress-bar {
    -webkit-transition: none !important;
    transition: none !important;
}
</style>

