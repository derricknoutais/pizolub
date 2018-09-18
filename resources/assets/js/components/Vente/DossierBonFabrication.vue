<template>
    <div class="container">

        <h2 class="text-center mt-3">Dossier Bon de Fabrication</h2>
        
        <table class="table mt-4 bg-white text-dark">
            <thead>
                <tr class="bg-primary text-light">
                    <th>Nº</i></th>
                    <th>OBSERVATION</th>
                    <th>ÉTAT</th>
                    <th>ÉMIS PAR </th>
                    <th>DATE DE CRÉATION</th>
                    <th>PRODUIRE</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(demande, index) in demandes">
                    <td scope="row"><a :href=" '/module-fabrication/dossier-bon-fabrication/' +  demande.id ">{{ demande.numéro }}</a></td>
                    <td>{{ demande.observation }}</td>
                    <td>{{ demande.enregistré ? 'Enregistré' : 'En Cours' }}</td>
                    <td>User Name</td>
                    <td>{{ demande.created_at }}</td>

                    <!-- :href=" '/api/bon-fabrication/' +  demande.id  + '/produire'" -->
                    <td v-if="demande.état === 'Enregistré'">
                        <button  class="btn btn-primary text-light" data-toggle="modal"  data-target="#exampleModal" @click="afficheCommandeARecevoir(index)">Produire</button>
                    </td>
                </tr>
            </tbody>
        </table> 
        <div class="modal fade" ref="myModal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" @keyup.right="afficheCommandeARecevoir(indexDuModal+1)">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-light">
                        <h5 class="modal-title" id="exampleModalLabel">Entrez Frais pour Commande</h5>
                        <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="progress" v-if="isLoading" style="height: 15px;" >
                        <div ref="progressBar" class="progress-bar bg-secondary" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">{{ progressValue }}%</div>
                    </div>
                    <div class="modal-body">
                        <label>Main d'Oeuvre</label>
                        <input type="number" class="form-control" v-model.number="frais.mainDOeuvre">
                        <label>Sous Traitance</label>
                        <input type="number" class="form-control" v-model.number="frais.sousTraitance">
                        <label>Charges Diverses</label>
                        <input type="number" class="form-control" v-model="frais.chargesDiverses">
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-secondary text-light" @click="enregistrerLesFrais()">Enregistrer</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Annuler</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    data(){
        return {
            frais: {
                mainDOeuvre: 0,
                sousTraitance: 0,
                chargesDiverses: 0,
            },
            demandes:{

            },
            index: 0,
            isLoading: false,
            progressValue: 0,
            commandeAProduire: {}
        }
    },
    methods: {
        afficheCommandeARecevoir(index){
            this.index = index
            this.commandeAProduire = this.demandes[index];
        },
        enregistrerLesFrais(){
            axios.post('/api/bon-fabrication/' + this.commandeAProduire.id +'/enregistrer-les-frais', this.frais ).then(response => {
                this.isLoading = true;
                this.$notify({
                  group: 'foo',
                  title: 'Succès',
                  type: 'success',
                  text: "Bon de Commande Nº " + response.data.numero + " créée avec Succès",
                });
                var id = setInterval(this.progress, 35);

                setTimeout(() => {
                    $('#exampleModal').modal('hide')
                    window.location.replace("/module-fabrication/dossier-bon-fabrication"); 
                }, 4500);

            }).catch(error => {
                console.log(error);
            });
        },
        progress(){
                if(this.progressValue < 100){
                    this.progressValue ++;
                }

                this.$refs.progressBar.style.width = this.progressValue + "%";

        }
    },
    mounted() {
        axios.get('/api/bon-fabrication/all').then(response => {
            this.demandes = response.data
            //console.log(response.data);
        })
    }
}
</script>
