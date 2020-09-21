<template>
  <div class="logo">
    <a href="http://localhost:8080/#/"><img :src="imgsrc" width="150px;"/></a>
  </div>
</template>
<script>
export default {
  computed: {
    imgsrc() {
      if (this.$route.name == "Search" || this.$route.name == "Home")
        return "img/logo2.png";
      else return "img/logo1.png";
    }
  }
};
</script>
<style lang="scss">
.logo {
  position: absolute;
  left: 10px;
  top: 10px;
  font-family: "楷体";
  font-size: 30px;
  z-index: 20;
  cursor: pointer;
  a {
    text-decoration: none;
    font-weight: bold;
    color: gray;
    font-family: "Courier New", Courier, monospace;
  }
}
</style>
