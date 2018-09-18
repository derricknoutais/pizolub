<template>
    <div class="container">

        <h2 class="text-center">Dossier Demande d'Achat</h2>
        
        <table class="table mt-4 bg-white text-dark">
            <thead>
                <tr class="bg-primary text-light">
                    <th>Nº</i></th>
                    <th>LIBELLÉ</th>
                    <th>ÉTAT</th>
                    <th>ÉMIS PAR </th>
                    <th>DATE DE CRÉATION</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="demande in demandes">
                    <td scope="row"><a :href=" '/module-achat/dossier-demande-achat/' +  demande.id ">{{ demande.numero }}</a></td>
                    <td>{{ demande.motif }}</td>
                    <td>{{ demande.état }}</td>
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
        axios.get('/module-achat/dossier-demande-achat/api').then(response => {
            this.demandes = response.data
            console.log(response.data);
        })
    }
}
</script>
