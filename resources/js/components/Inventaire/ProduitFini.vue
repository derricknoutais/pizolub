<template>
    <div class="container">
        <h2 class="text-center mt-3">Inventaire Produits Finis au 15/10/2018</h2>
        <table class="table table-bordered mt-4 bg-white text-dark">
            <thead>
                <tr class="bg-primary text-light">
                    <th>Huiles de base</th>
                    <th>Conditionnement</th>
                    <th>Fournisseur</th>
                    <th>Stock Total</th>
                    <th>Coût de Production Moyen</th>
                    <th>Valeur</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="produit in produits.data">
                    <td scope="row"><a :href="'/stock/produitfini/' + produit.id">{{ produit.nom }}</a></td>
                    <td>{{ produit.client.nom }}</td>
                    <td>{{ produit.quantité }}</td>
                    <td>{{ produit.cpm }}</td>
                    <td>{{ produit.valeur }}</td>
                </tr>
            </tbody>
        </table>
        <div class="row m-5 justify-content-center">
            <pagination :data="this.produits" @pagination-change-page="fetch"></pagination>
        </div>
    </div>
</template>
<script>

export default {
    data() {
        return {
            produits: {},
            paginate: ['produit-finis']
        }
    },
    methods: {
        fetch(page = 1) {
            axios.get('/api/produit-finis/inventaire?page=' + page).then(response => {
                console.log(response.data)
                this.produits = response.data
            }).catch(error => {
                console.log(error);
            });
        }
    },
    mounted() {
        this.fetch();
    }
}
</script>
