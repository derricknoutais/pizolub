<template>
    <div class="container">
        <h2 class="mt-4 text-center">MODULE INVENTAIRE </h2>
        <div class="row justify-content-center mt-5">
            <carte link="/api/module-inventaire/Huile Base" image="/illustrations/Huile-de-Base.svg" text="Huile de Base" img_width="30"></carte>
            <carte link="/api/module-inventaire/Additif" image="/illustrations/additif.svg" text="Additifs" img_width="46"></carte>
        </div>
        <div class="row justify-content-center my-4">
            <carte  link="/module-inventaire/produits-finis" image="/illustrations/Produits-Finis.svg" text="Produits Finis" img_width="30"></carte>
            <carte image="/illustrations/divers.svg" text="Autres" img_width="30" :toggler="this.divers" @click.native="toggle"></carte>
        </div>
        <transition :duration="300" enter-active-class="animated fadeIn" leave-active-class="animated fadeOut">
            <div class="row justify-content-center mt-5 animated" v-if="divers" transition="fade">
                <mini-carte link="/api/module-inventaire/Virolle" text="Virolle"></mini-carte>
                <mini-carte link="/api/module-inventaire/Accessoire Fûts" text="Accessoires Fûts"></mini-carte>
                <mini-carte link="/api/module-inventaire/Étiquette" text="Étiquettes"></mini-carte>
                <mini-carte link="/api/module-inventaire/Divers" text="Divers"></mini-carte>
                <mini-carte link="/api/module-inventaire/Bouchon" text="Bouchons"></mini-carte>
                <mini-carte link="/api/module-inventaire/Vidange" text="Vidange"></mini-carte>
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
