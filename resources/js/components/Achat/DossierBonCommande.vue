<template>
    <div>
        <notifications group="foo" position="top left" classes="vue-notification mt-2 ml-1" width="20%"/>
        <h2 class="text-center">Dossier Bon de Commande</h2>
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
                    <th>Nº</th>
                    <th>ÉTAT</th>
                    <th>ÉMIS PAR </th>
                    <th>DATE DE CRÉATION</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="commande,index in filtered">
                    <td scope="row"><a :href=" '/module-achat/dossier-bon-commande/' + commande.id " data-toggle="tooltip" data-placement="top" :title=" 'Cliquer pour voir les détails de la commande Nº' + commande.numero">{{ commande.numero }}</a></td>
                    <td>{{ commande.état }}</td>
                    <td>{{ commande.agent.name }}</td>
                    <td>{{ commande.created_at }}</td>
                    <td v-if="in_session.role === 'DG' || in_session.role === 'DAF'">
                        <button v-if=" commande.état === 'En Attente de Validation' " class="btn btn-primary" @click="valider(commande)">Valider</button>
                        <button @click="afficheCommandeARecevoir(index)" v-if="commande.état == 'Validé'" class="btn btn-primary text-light mt-1" data-toggle="modal" data-target="#exampleModal">Recevoir Commande</button>
                    </td>
                    
                </tr>
            </tbody>
        </table>
        <div class="modal fade" ref="myModal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" @keyup.right="afficheCommandeARecevoir(indexDuModal+1)">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-light">
                        <h5 class="modal-title" id="exampleModalLabel">Entrez Frais pour Commande {{ commandeAReçevoir.numero  }}</h5>
                        <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="progress" v-if="isLoading" style="height: 15px;" >
                        <div ref="progressBar" class="progress-bar bg-primary" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">{{ progressValue }}%</div>
                    </div>
                    <div class="modal-body">
                        <label>Frais de Douanes</label>
                        <input type="number" class="form-control" v-model.number="frais.douane">
                        <label>Frais de Transport</label>
                        <input type="number" class="form-control" v-model.number="frais.transport">
                        <label>Frais Divers</label>
                        <input type="number" class="form-control" v-model.number="frais.divers">
                    </div>
                    <div class="modal-footer justify-content-center">
                        <button type="button" class="btn btn-secondary text-light" @click="enregistrerLesFrais">Enregistrer</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Annuler</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
  data() {
    return {
      commandes: [],
      commandeAReçevoir: {},
      indexDuModal: null,
      frais: {
          douane: 100,
          transport: 200,
          divers: 300
      },
      isLoading: false,
      progressValue: 0,
    filtered: [],
    datedu: '',
    dateau: '',
    in_session: {}
    };
  },
  methods: {
        afficheCommandeARecevoir(index){
            this.index = index
            this.commandeAReçevoir = this.commandes[index];
        },
        enregistrerLesFrais(){
            axios.post('/api/bon-commande/' + this.commandeAReçevoir.id +'/enregistrer-les-frais', this.frais ).then(response => {
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
                    window.location.replace("/module-achat/dossier-bon-commande"); 
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
        },
        filtrer(){
            this.filtered = this.commandes.filter(element => {
                return Date.parse(element.created_at.replace('-','/','g')) > Date.parse(this.datedu) && (Date.parse(element.created_at.replace('-','/','g'))) < Date.parse(this.dateau)
            });
        },
        valider(demande){
            axios.get('/api/bon-commande/valider/' + demande.id).then(response => {

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
  },
  mounted() {
    axios.get("/api/bon-commande/all").then(response => {
        this.filtered = this.commandes = response.data;
      })
      .catch(error => {
        console.log(error);
    });
    axios.get('/api/users/in-session').then(response => {
        this.in_session = response.data

    }).catch(error => {
        console.log(error);
    });
  },
};
</script>

