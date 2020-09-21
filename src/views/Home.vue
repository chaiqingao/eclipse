<template>
  <div class="home">
    <video
      id="video-index"
      autoplay="true"
      muted="true"
      loop="true"
      src="video/eclipse.mp4"
      style="position: fixed;
top: 0px;
left: 0px;
right: 0px;
bottom: 0px;width: 100%; height: 100%; margin: 0px;object-fit:cover;"
    ></video>
    <div class="description">
      <h1><font color="gray">羲和</font></h1>
      <h2><font color="gray">追寻日食的壮观与美丽</font></h2>
      <div class="btn-panel">
        <a href="#/search" class="btn btn-index-home"
          ><span style="margin: 20px 40px 20px 40px;">开始探索</span></a
        >
      </div>
    </div>
  </div>
</template>

<script>
import EventBus from "@/EventBus.js";
export default {
  mounted() {
    EventBus.$emit("router_change", "Home");
  }
};
</script>

<style lang="scss">
.home {
  z-index: -1;
}
.description {
  position: absolute;
  top: 30%;
  width: 80%;
  left: 0;
  margin-left: 10%;
  text-align: center;
  h1 {
    font-family: "楷体";
    font-size: 100px;
    margin-bottom: 0px;
    color: gray;
  }
}
.btn-panel {
  margin-top: 20px;
  cursor: pointer;
  a {
    border: 1px solid white;
    text-align: center;
    padding: 9px;
    border-radius: 25px;
    width: 140px;
    height: 40px;
    text-indent: 10px;
    background-color: transparent;
    margin-left: 0;
    text-indent: 10px;
    font-size: 14px;
    font-weight: 400;
    line-height: 1.42857143;
    text-decoration: none;
    color: gray;
  }
  a:hover {
    background-color: white;
    color: black;
  }
}
</style>
