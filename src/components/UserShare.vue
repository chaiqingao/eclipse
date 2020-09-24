<template>
  <div id="card5">
    <div>
      <div id="card5_text">
        <p id="card5_title">用户分享</p>
      </div>
    </div>
    <div id="card5_content">
      <div class="user-share-card">
        <el-carousel
          ref="usersharecard"
          height="700px"
          direction="vertical"
          :autoplay="false"
          :interval="4000"
          @change="shareChange"
        >
          <el-carousel-item v-for="(item, index) in userShares" :key="index">
            <div
              style="background-color: rgb(38, 198, 218); border-color: rgb(38, 198, 218);height:510px;padding:20px;"
            >
              <h1 style="color:white;">
                <i class="el-icon-news"></i> {{ item.pTitle }}
              </h1>
              <img :src="item.img" width="100%" />
              <h1 style="color: hsla(0,0%,100%,.7);">
                {{ "“" + item.pContent + "”" }}
              </h1>
              <div
                style="background-color:rgb(199,195,208); width: 100%;height: 100px;position: absolute;left:0px;bottom:0px;margin:0px;margin-bottom:50px"
              >
                <h2
                  style="color:white;position:absolute;bottom: 0px;left:20px;"
                >
                  <i class="el-icon-location-information"></i>
                  {{ item.Pos_lon + "°E, " + item.Pos_lat + "°N" }}<br />
                  <i class="el-icon-user"></i>
                  {{ item.pUserName }}
                </h2>
                <h2
                  style="color:white;position:absolute;bottom:0px;right:20px;"
                >
                  <i class="el-icon-view"></i> {{ item.v1 }} ·
                  <i class="el-icon-share"></i> {{ item.v2 }}
                </h2>
              </div>
            </div>
          </el-carousel-item>
        </el-carousel>
      </div>
    </div>
  </div>
</template>

<script>
import EventBus from "@/EventBus.js";
export default {
  data() {
    return {
      userShares: []
    };
  },
  created() {
    EventBus.$on("user_post_changed", this.changeShare);
  },
  beforeDestroy() {
    EventBus.$off("user_post_changed", this.changeShare);
  },
  mounted() {
    this.axios.get("api/postscripts").then(response => {
      let data = response.data;
      for (let i = 0; i < data.length; i++) {
        data[i].v1 = Math.ceil(Math.random() * 100);
        data[i].v2 = Math.ceil(data[i].v1 / Math.random() / 5);
        data[i].img = "img/postscript/" + (i + 1) + ".jpg";
      }
      this.userShares = data;
    });
  },
  methods: {
    // eslint-disable-next-line no-unused-vars
    shareChange(cur, last) {
      EventBus.$emit("shareChange", cur);
    },
    changeShare(idx) {
      if (idx >= 0 && idx < this.userShares.length) {
        this.$refs.usersharecard.setActiveItem(idx);
      }
    }
  }
};
</script>

<style lang="scss">
#card5 {
  border: 1px solid grey;
  position: absolute;
  padding: 2px;
  right: 15px;
  bottom: 40px;
  width: 25vw;
  height: 90vh;
  overflow: hidden;
}
#card5_text {
  width: 98.5%;
  height: 4vh;
  line-height: 24px;
  background: rgba(100, 191, 255, 0.3);
  padding-left: 2px;
  border-left: 2px solid #64bfff;
}
#card5_text p {
  font-size: 12px;
  color: #000;
  text-align: left;
  margin: 0;
}
#card5_content {
  height: 100%;
}
.user-share-card {
  width: 100%;
}
.el-carousel__item {
  text-align: left;
  opacity: 0.8;
  // border-radius: 10px;
}
</style>
