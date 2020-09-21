<template>
  <div id="app">
    <ModeSelect />
    <Logo />
    <router-view />
  </div>
</template>

<script>
import Logo from "@/components/Logo.vue";
import ModeSelect from "@/components/ModeSelect.vue";
export default {
  components: {
    ModeSelect,
    Logo
  }
};
</script>

<style lang="scss">
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
