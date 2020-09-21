<template>
  <div id="card3">
    <div>
      <div id="card3_text">
        <p id="card3_title">景点信息</p>
      </div>
    </div>
    <div id="card3_content">
      <div class="scenic-spot">
        <!-- <h1 id="top">导航</h1>
    起点：<el-input
      v-model="start"
      placeholder="输入起点或在地图上选点"
      style="width: 60%;"
      :clearable="true"
    ></el-input
    ><br />
    终点：<el-input
      v-model="end"
      placeholder="输入终点或在地图上选点"
      style="width: 60%;"
      :clearable="true"
    ></el-input
    ><br />
    <el-button type="primary">出发！</el-button> -->
        <div
          style="position:relative;background-color: white;"
          v-if="scenicSpots.length > 0"
        >
          <img
            :src="'data:image/png;base64,' + scenicSpots[activeName].img"
            width="100%"
          />
          <div
            style="position:absolute; z-index:2; left:0px; bottom:0px;background-color:rgba(0,0,0,0.6);width:100%;"
          >
            <h1 style="color: white;margin-left:10px;">
              {{ scenicSpots[activeName].SNameShort }}
            </h1>
          </div>
        </div>

        <div style="padding:10px;" v-if="scenicSpots.length > 0">
          <h2
            v-show="scenicSpots[activeName].showWeathre"
            style="color:gray;text-height:30px;"
          >
            <img :src="scenicSpots[activeName].weather_code" height="30px" />
            {{ scenicSpots[activeName].weather
            }}{{
              scenicSpots[activeName].tmp_min +
                "°C~" +
                scenicSpots[activeName].tmp_max +
                "°C"
            }}
          </h2>
          <h2 style="direction: ltr;line-height: 190%">
            {{ scenicSpots[activeName].info }}
          </h2>
        </div>
        <!--<el-collapse
      style="direction: ltr;text-align:left;"
      v-model="activeName"
      accordion
    >
      <el-collapse-item
        v-for="(item, index) in scenicSpots"
        :key="index"
        :title="item.SName"
        :name="index"
      >
        <div style="position:relative;background-color: white;">
          <img :src="'data:image/png;base64,' + item.img" width="100%" />
          <div
            style="position:absolute; z-index:2; left:0px; bottom:0px;background-color:rgba(0,0,0,0.6);width:100%;"
          >
            <h1 style="color: white;margin-left:10px;">
              {{ item.SNameShort }}
            </h1>
          </div>
        </div>

        <div style="padding:10px;">
          <h2 v-show="item.showWeathre" style="color:gray;text-height:30px;">
            <img :src="item.weather_code" height="30px" />
            {{ item.weather }}{{ item.tmp_min + "°C~" + item.tmp_max + "°C" }}
          </h2>
          <h3 style="direction: ltr;">{{ item.info }}</h3>
        </div>
         <div style="width:100%;text-align:center;">
          <el-button type="text" @click="go(item.SName)">到这儿去</el-button>
        </div> 
      </el-collapse-item>
    </el-collapse>-->
      </div>
    </div>
  </div>
</template>
<script>
import EventBus from "@/EventBus.js";
export default {
  data() {
    return {
      start: "我的位置",
      end: "",
      count: 10,
      loading: false,
      activeName: 0,
      scenicSpots: []
    };
  },
  created() {
    EventBus.$on("spot_changed", this.spot_changed);
  },
  beforeDestroy() {
    EventBus.$off("spot_changed", this.spot_changed);
  },
  mounted() {
    this.axios
      .get("api/scenicspot", {
        headers: {
          Accept:
            "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9"
        }
      })
      .then(response => {
        let data = response.data;
        data = this.$x2js.xml2js(data).scenicspots.scenicspot;
        this.axios
          .get("api/scenicspot/getAllImg")
          .then(response => {
            var imgs = response.data;
            try {
              imgs = JSON.parse(imgs);
            } catch (error) {
              console.log();
            }
            for (let i = 0; i < data.length; i++) {
              data[i].showWeathre = false;
              data[i].img = imgs[i].img;
              this.axios
                .get(
                  "https://free-api.heweather.net/s6/weather/forecast?location=" +
                    data[i].longitude +
                    "," +
                    data[i].latitude +
                    "&key=7e98e9fb1ec543dd8b503c45b8782a05&lang=zh"
                  //"&key=762eaea56cf14c248e56de56a0d21257&lang=zh"
                )
                .then(response => {
                  try {
                    var weather = response.data.HeWeather6[0].daily_forecast[0];
                    data[i].weather_code =
                      "/img/weather/" + weather.cond_code_d + ".png";
                    data[i].weather = weather.cond_txt_d;
                    data[i].tmp_min = weather.tmp_min;
                    data[i].tmp_max = weather.tmp_max;
                    data[i].showWeathre = true;
                  } catch (error) {
                    data[i].showWeathre = false;
                  }
                });
            }
            this.scenicSpots = data;
          })
          .catch(() => {
            this.scenicSpots = data;
          });
      });
  },
  methods: {
    go(place) {
      this.end = place;
    },
    spot_changed(sid) {
      this.activeName = sid;
    }
  }
};
</script>
<style lang="scss">
#card3 {
  border: 1px solid grey;
  position: absolute;
  padding: 2px;
  left: 15px;
  top: 100px;
  width: 25vw;
  height: 80vh;
  overflow: hidden;
}
#card3_text {
  width: 98.5%;
  height: 4vh;
  line-height: 24px;
  background: rgba(100, 191, 255, 0.3);
  padding-left: 2px;
  border-left: 2px solid #64bfff;
}
#card3_text p {
  font-size: 12px;
  color: #000;
  text-align: left;
  margin: 0;
}
#card3_content {
  height: 100%;
  width: 25vw;
  background-color: rgba(235, 245, 249, 0.6);
}
.scenic-spot {
  // width: 300px;
  height: 100%;
  overflow: auto;
  padding: 0px;
  direction: rtl;
  background-color: rgba(235, 245, 249, 0.6);
  opacity: 0.8;
  overflow: hidden;
}
</style>
