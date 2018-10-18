<template>
    <div class="container">

        <h2 class="text-center mt-3">Dossier Demande de Production</h2>
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
                <tr v-for="demande in filtered">
                    <td scope="row"><a :href=" '/module-fabrication/dossier-demande-fabrication/' +  demande.id ">{{ demande.numéro }}</a></td>
                    <td>{{ demande.observation }}</td>
                    <td>{{ demande.état }}</td>
                    <td>{{ demande.agent.name }}</td>
                    <td>{{ demande.created_at }}</td>
                    <td v-if="in_session.role === 'DG' || in_session.role === 'DC'">
                        <button v-if="! demande.validé" class="btn btn-primary" @click="valider(demande)">Valider</button>
                    </td>
                </tr>
            </tbody>
        </table> 
    </div>
</template>
<script>
export default {
    data(){
        return {
            demandes:{},
            filtered: [],
            datedu: '',
            dateau: '',
            in_session: {}
        }
    },
    methods: {
        filtrer(){
            this.filtered = this.demandes.filter(element => {
                return Date.parse(element.created_at.replace('-','/','g')) > Date.parse(this.datedu) && (Date.parse(element.created_at.replace('-','/','g'))) < Date.parse(this.dateau)
            });
        },
        valider(demande){
            axios.get('/api/demande-fabrication/valider/' + demande.id).then(response => {

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
        axios.get('/api/demande-fabrication/all').then(response => {
            this.demandes = this.filtered = response.data
            //console.log(response.data);
        });
        axios.get('/api/users/in-session').then(response => {
            console.log(response.data)
            this.in_session = response.data;
        })
    }
}
</script>
