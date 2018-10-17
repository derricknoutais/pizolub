<template>
<div>
    <div class="progress" v-if="isActive" style="height: 15px;" >
        <div ref="progressBar" class="progress-bar bg-primary" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">{{ progressValue }}%</div>
    </div>

    <div class="container">
        <notifications group="foo" position="top left" classes="vue-notification mt-2 ml-1" width="20%"/>
        
        <h1 class="text-center my-5">Créer une Demande de Production</h1>
        <div class="col-md-6 offset-md-3">
            <form method="POST" @submit.prevent="storeForm">
                <div class="form-group">
                    <label for="">Selectionner un Client</label>
                    <select v-model.number="formulaire.client_id" class="form-control" :class="errors.client_id ? 'border-danger' : '' ">
                        <option v-for="client in clients" :value="client.id" >{{ client.nom }}</option>
                        
                    </select>
                    <small v-if="errors.client_id" v-for="client in errors.client_id" class="text-danger">{{ client }}</small>
                </div>
                <div class="form-group">
                    <label for="">Observations</label>
                    <textarea v-model="formulaire.observation" rows="3" class="form-control" :class="errors.observation ? 'border-danger' : '' "></textarea>
                    <small v-if="errors.observation" v-for="obs in errors.observation" class="text-danger">{{ obs }}</small>
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
            type: 1,
            clients: {

            },
            formulaire : {
                client_id: "",
                observation: '',
            },
            
            motif: '',
            errors: {

            },
            isActive: false,
            progressValue: 0
        }
    },
    methods:{
        storeForm(){
            this.isActive = true;
            axios.post('/api/demande-fabrication/créeUneDemande', this.formulaire)
                .then((response) => {
                this.errors = {}
                this.$notify({
                  group: 'foo',
                  title: 'Succès',
                  type: 'success',
                  text: "Bon de Vente Nº " + response.data.numero + " créé avec Succès",
                });
                var id = setInterval(this.progress, 35);
                setTimeout(() => {
                    window.location.replace("/module-fabrication/dossier-demande-fabrication/" + response.data.id); 
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
       axios.get('/api/client/all').then(response => {
           this.clients = response.data
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

