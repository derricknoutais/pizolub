<template>
    <div class="container-fluid">
        <h2 class="text-center my-5">FICHE DE STOCK {{ produit.nom }}</h2>
        <div class="col-md-6 offset-md-3">
            <table class="table table-bordered mt-4 bg-white text-dark">
                <thead>
                    <tr class="bg-primary text-light">
                        <th>Type de Mouvement</th>
                        <th>Quantité Entrée</th>
                        <th>Quantité Sortie</th>
                        <th>Coût Unitaire</th>
                        <th>Cout Total</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="stock in stocks">
                        <td scope="row">{{ stock.entrée ? 'Entrée' : 'Sortie' }}</td>
                        <td>{{ stock.entrée ? stock.entrée : '---' }}</td>
                        <td>{{ stock.sortie ? stock.sortie : '---' }}</td>
                        <td>{{ stock.entrée ? stock.coût_achat_unitaire : stock.coût_vente_unitaire }}</td>
                        <td>{{ stock.entrée ? stock.coût_achat_total : stock.coût_vente_total }}</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</template>
<script>
export default {
    props: ['stocks', 'produit']
}
</script>
