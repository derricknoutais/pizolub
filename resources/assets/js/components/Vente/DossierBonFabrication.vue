<template>
    <div class="container">

        <h2 class="text-center mt-3">Dossier Bon de Production</h2>
        <div class="row">
            <div class="col-md-2">Filtrer du :</div>
            <div class="col-md-2">au :</div>
        </div>
        <div class="row">
            <div class="col-md-2"><input type="date" v-model.date="datedu" class="form-control"> </div>
            <div class="col-md-2"><input type="date" v-model="dateau" class="form-control"></div>
            <!-- <div class="col-md-2">
                <select v-model="etat" class="form-control">
                    <option value="En Attente de Validation">En Attente de Validation</option>
                    <option value="En Cours">En Cours</option>
                </select>
            </div> -->
            <!-- <div class="col-md-2">
                <select v-model="utilisateur" class="form-control">
                    <option :value="user.id" v-for="user in users">{{ user.name }}</option>
                </select>
            </div> -->
            <div class="col-md-2"><button class="btn btn-primary" @click="filtrer()">Filter</button></div>
            <!-- <div class="col-md-2"><button class="btn btn-primary" @click="reinitialiser()">Réinitialiser</button></div> -->
        </div>
        <table class="table mt-4 bg-white text-dark">
            <thead>
                <tr class="bg-primary text-light">
                    <th>Nº</i></th>
                    <th>OBSERVATION</th>
                    <th>ÉTAT</th>
                    <th>ÉMIS PAR </th>
                    <th>DATE DE CRÉATION</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(demande, index) in filtered">
                    <td scope="row"><a :href=" '/module-fabrication/dossier-bon-fabrication/' +  demande.id ">{{ demande.numéro }}</a></td>
                    <td>{{ demande.observation }}</td>
                    <td>{{ demande.état}}</td>
                    <td>{{ demande.agent.name }}</td>
                    <td>{{ demande.created_at }}</td>

                    <!-- :href=" '/api/bon-fabrication/' +  demande.id  + '/produire'" -->
                    <td v-if="demande.état === 'Validé'">
                        <button  class="btn btn-primary text-light" data-toggle="modal"  data-target="#exampleModal" @click="afficheCommandeARecevoir(index)">Produire</button>
                    </td>
                    <td v-if="in_session.role === 'DG' || in_session.role === 'DT'">
                        <button v-if="demande.état === 'En Attente de Validation'" class="btn btn-primary" @click="valider(demande)">Valider</button>
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
                        <div ref="progressBar" class="progress-bar bg-primary" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">{{ progressValue }}%</div>
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
            commandeAProduire: {},
            filtered: [],
            datedu: '',
            dateau: '',
            in_session: {}
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
        valider(demande){
            axios.get('/api/bon-fabrication/valider/' + demande.id).then(response => {

                this.$notify({ group: 'foo', title: 'Succès',
                  type: 'success',
                  text: "Demande d'Achat Nº " + demande.numero + " validée avec succès",
                });

                setTimeout(function(){
                    location.reload()
                }, 3000);

            }).catch(error => {
                console.log(error);
            });
        },
        progress(){
                if(this.progressValue < 100){
                    this.progressValue ++;
                }
                this.$refs.progressBar.style.width = this.progressValue + "%";
        },
        filtrer(){
            this.filtered = this.demandes.filter(element => {
                return Date.parse(element.created_at.replace('-','/','g')) > Date.parse(this.datedu) && (Date.parse(element.created_at.replace('-','/','g'))) < Date.parse(this.dateau)
            });
        },
    },
    mounted() {
        axios.get('/api/bon-fabrication/all').then(response => {
            this.demandes = this.filtered = response.data
        });
        axios.get('/api/users/in-session').then(response => {
            console.log(response.data)
            this.in_session = response.data;
        })
    }
}
</script>
