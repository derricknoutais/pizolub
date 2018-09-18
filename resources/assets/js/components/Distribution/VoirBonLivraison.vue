<template>
<div>
    <div class="progress" v-if="isLoading" style="height: 15px;" >
        <div ref="progressBar" class="progress-bar bg-primary" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">{{ progressValue }}%</div>
    </div>
    <notifications group="foo" position="top left" classes="vue-notification mt-2 ml-1" width="20%"/>
    <h1 class="text-center my-5">Bon de Livraison Nº{{ bon.id }}</h1>
    <div class="row mt-4">
        <div class="col-md-6 offset-md-3">
            <table class="table table-striped ">
                <thead>
                    <tr>
                        <th>Nom du Produit</th>
                        <th>Quantité Stockée</th>
                        <th>Quantité à Livrer</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(produit, index) in bon.demande.produits">
                        <td>{{ produit.nom }}</td>
                        <td>{{ produit.pivot.quantité }}</td>
                        <td>
                            <span v-if="bon.état === 'Enregistré'">{{ bon.produits[index].pivot.quantité }}</span>
                            <input v-else type="number" :id="index"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="form-group col-md-12 text-center text-center mt-5" >
            <button class="btn btn-secondary text-light" @click="enregistreLesQuantités()">Enregistrer Le Bon</button>
        </div>
    </div> 
</div>
    
</template>
<script>
export default {
    props : ['bon', 'demande'],
    data(){
        return {
            data: [],
            isLoading: false,
            progressValue: 0,
        }
    },
    methods: {
        prepareData(){
            this.bon.produits.forEach((element, index) => {
                this.data.push(parseInt(document.getElementById(index).value));
            });
        },
        enregistreLesQuantités()
        {
            this.isLoading = true
            this.prepareData();
            axios.post('/api/bon-distribution/'+ 'ajouteLesQuantitésALivrer/' + this.bon.id , this.data).then(response => {
                this.isLoading = true
                this.$notify({ group: 'foo', title: 'Succès',
                  type: 'success',
                  text: "Demande d'Achat Nº " + response.data.numero + " enregistré et envoyé avec succès",
                });
                var id = setInterval(this.progress, 35);
                setTimeout(() => {
                    window.location.replace("/module-distribution/dossier-bon-distribution/" + this.bon.id); 
                }, 4500);
            }).catch(error => {
                console.log(error);
            });
        },
        progress()
        {
            if(this.progressValue < 100){
                this.progressValue ++;
            }
            this.$refs.progressBar.style.width = this.progressValue + "%";
        }
        
    },
    mounted(){
    }

}
</script>
