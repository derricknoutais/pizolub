<template>
    <div>
        <div class="row">
            <div class="col-md-2">Filtrer du :</div>
            <div class="col-md-2">au :</div>
        </div>
        <div class="row">
            <div class="col-md-2"><input type="date" v-model.date="datedu" class="form-control"> </div>
            <div class="col-md-2"><input type="date" v-model="dateau" class="form-control"></div>
            <div class="col-md-2"><button class="btn btn-primary" @click="filtrer()">Filter</button></div>
        </div>
    </div>  
</template>
<script>
export default {
    props: ['repertoire', 'filtered'],
    data(){
        return {
            datedu: '',
            dateau: '',
            temp: [],
        }
    },
    methods: {
        filtrer(){
            this.temp = this.repertoire.filter(element => {
                return Date.parse(element.created_at.replace('-','/','g')) > Date.parse(this.datedu) && (Date.parse(element.created_at.replace('-','/','g'))) < Date.parse(this.dateau)
            });
            this.filtered = this.temp;
        },
    },
    mounted(){
        
    }   
}
</script>
