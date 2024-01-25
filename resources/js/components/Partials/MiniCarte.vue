<template>
    <div class="col-md-2">
        <a :href="this.link">
            <div class="card bg-primary">
                <div class="card-body text-center text-white">{{ this.text }}</div>
            </div>
        </a>
        
    </div>
</template>
<script>
export default {
    props:{
        text: {
        },
        link:{}
    }
}
</script>

