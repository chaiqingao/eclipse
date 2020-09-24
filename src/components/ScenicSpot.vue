<template>
  <div id="card3">
    <div>
      <div id="card3_text">
        <p id="card3_title">景点信息</p>
      </div>
    </div>
    <div id="card3_content">
      <div class="scenic-spot">
        <div
          style="position:relative;background-color: white;"
          v-if="scenicSpots.length > 0"
        >
          <img
            :src="'data:image/png;base64,' + scenicSpots[activeName].ImageData"
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
          <h3 style="direction: ltr;line-height: 190%">
            {{ scenicSpots[activeName].Info }}
          </h3>
        </div>
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
    this.axios.get("api/scenicspot").then(response => {
      let data = response.data;
      for (let i = 0; i < data.length; i++) {
        data[i].showWeathre = false;
        this.axios
          .get(
            "https://free-api.heweather.net/s6/weather/forecast?location=" +
              data[i].Longitude +
              "," +
              data[i].Latitude +
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
  text-align: left;
}
</style>
