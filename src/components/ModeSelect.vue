<template>
  <div class="modeselect" v-show="this.$route.name != 'Home'">
    <BookMark
      v-for="(mode, index) in modes"
      :key="index"
      :name="mode.name"
      :router_name="mode.router_name"
      :color="mode.color"
      :imgsrc="mode.src"
    />
  </div>
</template>
<script>
import BookMark from "@/components/BookMark.vue";
export default {
  components: {
    BookMark
  },
  data() {
    return {
      modes: [
        {
          name: "查询模式🔍",
          router_name: "Search",
          color: "#c7f5ff",
          src: "img/ctyimg/chaxunlogo.png"
        },
        {
          name: "旅行模式👟",
          router_name: "Travel",
          color: "#f6fcae",
          src: "img/ctyimg/lvxinglogo.png"
        },
        {
          name: "社交模式👨‍👨‍👧‍👦",
          router_name: "Social",
          color: "rgb(200,236,194)",
          src: "img/ctyimg/shejiaologo.png"
        }
      ]
    };
  }
};
</script>
<style lang="scss">
.modeselect {
  position: absolute;
  top: 0px;
  right: 30%;
  z-index: 20;
}
</style>
