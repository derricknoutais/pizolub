<template>
    <div id="h">
        <button v-if="data.enregistré" class="btn btn-secondary text-white" @click="printDoc()"><i class="mx-1" :class="isLoading ? 'fa fa-spinner fa-spin' : 'fas fa-print' "></i>Imprimer</button>
        <slot></slot>
    </div>
        
</template>
<script>
export default {
    props: ['data', 'isLoading'],
    methods: {
        printDoc(){
            document.getElementById('h').style.visibility = 'hidden'
            window.print();
            document.getElementById('h').style.visibility = 'visible'
        }
    }
}
</script>

