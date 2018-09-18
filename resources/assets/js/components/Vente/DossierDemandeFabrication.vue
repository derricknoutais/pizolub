<template>
    <div class="container">

        <h2 class="text-center mt-3">Dossier Demande de Fabrication</h2>
        
        <table class="table mt-4 bg-white text-dark">
            <thead>
                <tr class="bg-primary text-light">
                    <th>Nº</i></th>
                    <th>OBSERVATION</th>
                    <th>ÉTAT</th>
                    <th>ÉMIS PAR </th>
                    <th>DATE DE CRÉATION</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="demande in demandes">
                    <td scope="row"><a :href=" '/module-fabrication/dossier-demande-fabrication/' +  demande.id ">{{ demande.numéro }}</a></td>
                    <td>{{ demande.observation }}</td>
                    <td>{{ demande.enregistré ? 'Enregistré' : 'En Cours' }}</td>
                    <td>User Name</td>
                    <td>{{ demande.created_at }}</td>
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

            }
        }
    },
    methods: {

    },
    mounted() {
        axios.get('/api/demande-fabrication/all').then(response => {
            this.demandes = response.data
            //console.log(response.data);
        })
    }
}
</script>
