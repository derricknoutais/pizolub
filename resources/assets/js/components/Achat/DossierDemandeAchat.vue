<template>
    <div class="container">
        <h2 class="text-center my-5">Dossier Demande d'Achat</h2>
        <notifications group="foo" position="top left" classes="vue-notification mt-2 ml-1" width="20%"/>
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
                    <th>LIBELLÉ</th>
                    <th>ÉTAT</th>
                    <th>ÉMIS PAR </th>
                    <th>DATE DE CRÉATION</th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="demande in filtered">
                    <td scope="row"><a :href=" '/module-achat/dossier-demande-achat/' +  demande.id ">{{ demande.numero }}</a></td>
                    <td>{{ demande.motif }}</td>
                    <td>{{ demande.état }}</td>
                    <td>{{ demande.agent.name }}</td>
                    <td>{{ demande.created_at }}</td>
                    <td v-if="in_session.role === 'DG' || in_session.role === 'DT'">
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
            demandes:{
            },
            datedu: '',
            dateau: '',
            filtered: [],
            etat: '',
            users: [],
            utilisateur: '',
            in_session: {}
        }
    },
    methods: {
        filtrer(){
            this.filtered = this.demandes.filter(element => {
                return Date.parse(element.created_at.replace('-','/','g')) > Date.parse(this.datedu) && (Date.parse(element.created_at.replace('-','/','g'))) < Date.parse(this.dateau)
            });
        },
        reinitialiser(){
            this.datedu = '';
            this.dateau = '';
            this.filtered = [];
            this.etat = '';
            axios.get('/module-achat/dossier-demande-achat/api').then(response => {
                this.filtered = this.demandes = response.data
            });
        },
        valider(demande){
            axios.get('/api/demande-achat/valider/' + demande.id).then(response => {

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
    watch: {
        etat(){
            this.filtered = this.demandes.filter( element => {
                return element.état === this.etat;
            });
        },
        utilisateur(){
            this.filtered = this.demandes.filter(element => {
                return element.agent_id === this.utilisateur
            })
        }
    },
    mounted() {
        axios.get('/module-achat/dossier-demande-achat/api').then(response => {
            this.filtered = this.demandes = response.data
        });
        axios.get('/api/users/all').then(response => {
            this.users = (response.data);
        });
        axios.get('/api/users/in-session').then(response => {
            console.log(response.data)
            this.in_session = response.data;
        })
    }
}
</script>
