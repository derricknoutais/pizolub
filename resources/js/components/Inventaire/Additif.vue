<template>
    <div class="container">
        <h2 class="text-center mt-3">Inventaire {{ type }} au {{ date | moment("dddd, Do MMMM YYYY")}}</h2>
        <div class="row mt-5">
            <div class="col-md-2">
                <div class="form-inline">
                    <label>Voir
                    <select name="" id="" class="form-control mx-2 input-sm" >
                        <option value="">10</option>
                        <option value="">20</option>
                        <option value="">30</option>
                    </select>Entrées</label>
                </div>
            </div>
            <div class="col-md-4">
                <div class="form-inline">
                    <label>Filtrer par:
                    <select name="" id="" class="form-control mx-2 input-sm" >
                        <option disabbled selected>Fournisseur</option>
                        <option value="">TOTAL O.M</option>
                        <option value="">LIBYA OIL SUPPLY</option>
                    </select>Entrées</label>
                </div>
            </div>
            <div class="col-md-2 offset-md-3">
                <div class="form-inline">
                    <label for="">Rechercher:
                    <input type="text" class="form-control input-sm mx-3 px-1">
                    </label>
                </div>
            </div>
        </div>
        <table class="table table-bordered mt-4 bg-white text-dark">
            <thead>
                <tr class="bg-primary text-light">
                    <th>NOM</th>
                    <th v-if="data[0].type === 'Additif'">FOURNISSEUR</th>
                    <th>STOCK TOTAL</th>
                    <th>C.U.M.P</th>
                    <th>VALEUR</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="additif in data">
                    <td scope="row"><a :href="'/stock/' + type + '/' + additif.id">{{ additif.nom }}</a></td>
                    <td v-if="additif.type === 'Additif'">{{ additif.fournisseur.nom }}</td>
                    <td>{{ additif.quantité | numFormat }}</td>
                    <td>{{ additif.cump | currency }}</td>
                    <td class="font-weight-bold">{{ additif.valeur | currency }}</td>
                </tr>
            </tbody>
        </table> 
    </div>
</template>
<script>

export default {
    props : ['data', 'type'],
    data(){
        return {
            date: ''
        }
    },
    methods:{
        financial(x) {
            if(x !== null && ! isNaN(x)){
                return Number.parseFloat(x).toFixed(2);
            } else {
                return 0;
            }       
        }
    },
    mounted(){
        // axios.get('/api/module-inventaire/additifs').then(response => {
        //     this.data = response.data;
        //     console.log(response.data);
            
        // }).catch(error => {
        //     console.log(error);
        // });
        this.date = new Date()
    }
}
</script>
