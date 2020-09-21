<template>
  <div id="card2">
    <div>
      <div id="card2_text"><p id="card2_title">新闻展示</p></div>
    </div>
    <div id="card2_content">
      <div class="card">
        <el-carousel
          height="400px"
          direction="vertical"
          :autoplay="true"
          :interval="4000"
        >
          <el-carousel-item v-for="(item, index) in news" :key="index">
            <div style="position:relative;">
              <img :src="item.img" height="200px" width="400px" />
              <div
                style="position:absolute; z-index:2; left:10px; bottom:10px;"
              >
                <h1 style="color: white;">{{ item.title }}</h1>
                <span style="color:gray;">{{ item.date }}</span>
              </div>
            </div>

            <p style="margin: 10px;">{{ item.content }}</p>
          </el-carousel-item>
        </el-carousel>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      news: []
    };
  },
  mounted() {
    this.axios.get("/news.json").then(response => {
      this.news = response.data;
      console.log(response.data.length);
    });
  }
};
</script>

<style lang="scss">
#card2 {
  border: 1px solid grey;
  position: absolute;
  padding: 2px;
  right: 15px;
  bottom: 81px;
  width: 25vw;
  height: 56vh;
  overflow: hidden;
}
#card2_text {
  width: 98.5%;
  height: 4vh;
  line-height: 24px;
  background: rgba(100, 191, 255, 0.3);
  padding-left: 2px;
  border-left: 2px solid #64bfff;
}
#card2_text p {
  font-size: 12px;
  color: #000;
  text-align: left;
  margin: 0;
}
#card2_content {
  height: 100%;
}
.card {
  width: 100%;
}
.el-carousel__item {
  text-align: left;
  // border-radius: 10px;
  box-shadow: 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 2px 2px 0 rgba(0, 0, 0, 0.14),
    0 1px 5px 0 rgba(0, 0, 0, 0.12);
}

.el-carousel__item:nth-child(2n) {
  background-color: rgba(235, 245, 249, 0.6);
}

.el-carousel__item:nth-child(2n + 1) {
  background-color: rgba(187, 221, 235, 0.6);
}
</style>
