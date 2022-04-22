<template>
  <div id="app">
    <HeaderComp/>
    <MainComp/>
  </div>
</template>

<script>
import "bootstrap"
import axios from 'axios';
import HeaderComp from "./components/HeaderComp.vue"
import MainComp from "./components/MainComp.vue"
export default {
  name: 'App',
  components:{
    HeaderComp,
    MainComp
  },
  mounted(){
    axios.get('')
  }
}
</script>

<style lang="scss">
@import "bootstrap/dist/css/bootstrap.min.css";

</style>
