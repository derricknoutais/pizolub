<template>
    <div class="container">
        <h2 class="mt-4 text-center">MODULE INVENTAIRE </h2>
        <div class="row justify-content-center mt-5">
            <carte link="api/module-inventaire/Huile Base" image="/illustrations/Huile-de-Base.svg" text="Huile de Base" img_width="30"></carte>
            <carte link="/api/module-inventaire/Additif" image="/illustrations/additif.svg" text="Additifs" img_width="46"></carte>
        </div>
        <div class="row justify-content-center my-4">
            <carte  link="/module-inventaire/produits-finis" image="/illustrations/Produits-Finis.svg" text="Produits Finis" img_width="30"></carte>
            <carte image="/illustrations/divers.svg" text="Autres" img_width="30" :toggler="this.divers" @click.native="toggle"></carte>
        </div>
        <transition :duration="300" enter-active-class="animated fadeIn" leave-active-class="animated fadeOut">
            <div class="row justify-content-center mt-5 animated" v-if="divers" transition="fade">
                <mini-carte link="/module-inventaire/virole" text="Virole"></mini-carte>
                <mini-carte link="/module-inventaire/pehd" text="PEHD"></mini-carte>
                <mini-carte link="/module-inventaire/etiquette" text="Étiquette"></mini-carte>
                <mini-carte link="/module-inventaire/matieres-premieres" text="Mat. Premières"></mini-carte>
                <mini-carte link="/module-inventaire/emballages" text="Emballage"></mini-carte>
            </div>
        </transition>
    </div>
</template>
<script>

export default {
    
    data(){
        return {
            divers: false,
            image: "/illustrations/plus.svg"
        }
    },
    methods: {
        
        toggle(){
            this.divers = !this.divers
        }
    }
}
</script>
<style>
a .card-link:hover{
  text-decoration: none
}
</style>
