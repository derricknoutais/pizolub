<template>
    <div :class=" 'col-md-' + this.cols">
        <a :href="this.link" class="card-link">
        <div class="card h-100 text-center d-flex bg-primary">
            <div class=" mt-3 card-head flex-fill" v-if="this.image">
                <img :class="'card-img-top text-center w-' + this.img_width" :src="this.image">
            </div>
            <div class="card-body">
                <h4 class="card-title text-center text-light">{{ this.text }}</h4>
            </div>
        </div>
        </a>
    </div>
</template>
<script>
export default {
    props:{
        image: {
        }, 
        text: {
        }, 
        toggler:{
        },
        cols:{
            default:4
        },
        img_width:{
        },
        link:{
            default:"#"
        }
    },
    methods: {

        toggle(){
            this.toggler = !this.toggler
        }
    }
}
</script>

