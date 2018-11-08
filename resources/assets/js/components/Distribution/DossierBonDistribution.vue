<template>
    <div class="container">

        <h2 class="text-center my-5">Dossier Bon de Distribution</h2>
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
                    <th>ÉTAT</th>
                    <th>ÉMIS PAR </th>
                    <th>DATE DE CRÉATION</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="(bon, index) in filtered">
                    <td scope="row">
                        <a :href=" '/module-distribution/dossier-bon-distribution/' +  bon.id ">{{ bon.numéro }}</a>
                    </td>
                    <td>{{ bon.état }}</td>
                    <td>{{ bon.agent.name }}</td>
                    <td>{{ bon.created_at }}</td>
                    <td v-if="bon.état === 'Validé'">
                        <button @click="afficheCommandeARecevoir(index)" class="btn btn-primary text-light mt-1" data-toggle="modal" data-target="#exampleModal">Livrer</button>
                    </td>
                    <td v-if="in_session.role === 'DG' || in_session.role === 'DC'">
                        <button v-if="bon.état === 'En Attente de Validation'" class="btn btn-primary" @click="valider(bon)">Valider</button>
                    </td>
                </tr>
            </tbody>
        </table> 
        <div class="modal fade" ref="myModal" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" @keyup.right="afficheCommandeARecevoir(indexDuModal+1)">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-light">
                        <h5 class="modal-title" id="exampleModalLabel">Entrez Frais pour Commande {{ bonALivrer.id  }}</h5>
                        <button type="button" class="close text-light" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="progress" v-if="isLoading" style="height: 15px;" >
                        <div ref="progressBar" class="progress-bar bg-primary" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">{{ progressValue }}%</div>
                    </div>
                    <div class="modal-body">
                        <label>Frais de Transport</label>
                        <input type="number" class="form-control" v-model.number="frais.transport">
                        <label>Frais Charges Diverses</label>
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
    data(){
        return {
            bons:{},
            bonALivrer: {},
            frais: {
                transport: 200,
                divers: 300
            },
            isLoading: false,
            progressValue: 0,
            index: 0,
            filtered: [],
            datedu: '',
            dateau: '',
            in_session: {}
        }
    },
    methods: {
        afficheCommandeARecevoir(index){
            this.index = index
            this.bonALivrer = this.bons[index];
        },
        enregistrerLesFrais(){
            axios.post('/api/bon-distribution/' + this.bonALivrer.id +'/enregistrer-les-frais', this.frais ).then(response => {
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
                    window.location.replace("/module-distribution/dossier-bon-distribution"); 
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
        valider(demande){
            axios.get('/api/bon-distribution/valider/' + demande.id).then(response => {

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
        filtrer(){
            this.filtered = this.demandes.filter(element => {
                return Date.parse(element.created_at.replace('-','/','g')) > Date.parse(this.datedu) && (Date.parse(element.created_at.replace('-','/','g'))) < Date.parse(this.dateau)
            });
        },
    },
    mounted() {
        axios.get('/api/bon-distribution/all').then(response => {
            this.bons = this.filtered = response.data
        })
        axios.get('/api/users/in-session').then(response => {
            console.log(response.data)
            this.in_session = response.data;
        })
    }
}
</script>
