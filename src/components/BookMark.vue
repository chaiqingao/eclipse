<template>
  <div class="bookmark" :class="{ active: active }" @click="clickme">
    <img :src="imgsrc" style="width:60px;height:130px;" />
  </div>
</template>

<script>
import EventBus from "@/EventBus.js";
export default {
  props: {
    name: String,
    router_name: String,
    color: String,
    imgsrc: String
  },
  data() {
    return {
      active: false
    };
  },
  created() {
    EventBus.$on("router_change", this.router_change);
  },
  beforeDestroy() {
    EventBus.$off("router_change", this.router_change);
  },
  methods: {
    clickme() {
      if (this.$router.currentRoute.name == this.router_name) return;
      this.$router.push({ name: this.router_name });
    },
    router_change(router_name) {
      this.active = this.router_name == router_name;
    }
  }
};
</script>
<style lang="scss">
.bookmark {
  float: left; /*水平方向放多个的设置*/
  margin-right: 10px; /*水平方向放多个的设置*/
  position: relative;
  padding: px 0;
  font-family: "楷体";
  font-size: 20px;
  color: black;
  user-select: none;
  border-radius: 0 0 50% 50%;
  width: 50px;
  text-align: center;
  cursor: pointer;
  top: -30px;
  transition: all 0.5s;
}
.bookmark:hover {
  top: 0px;
}
.bookmark.active {
  top: 0px;
}
</style>
