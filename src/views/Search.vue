<template>
  <div id="map" class="search">
    <div style="position:absolute;z-index:10">
      <img src="img/ctyimg/Body01.png" alt="img" width="100%" />
    </div>
    <div>
      <h1
        style="font-size: 50px;text-align: center;position:absolute;top:35%;left:30%;width:600px;height:100px;z-index:21;"
        id="sp_time"
      >
        {{ daojishi[0] }}<span class="datetext">DAYS</span> {{ daojishi[1]
        }}<span class="datetext">HRS</span> {{ daojishi[2]
        }}<span class="datetext">MINS </span>
        <span style="color:#E44379;">{{ daojishi[3] }}</span>
        <span class="datetext">SECS</span>
      </h1>
      <p
        style="font-size: 30px;text-align: center;position:absolute;top:27%;left:30%;width:600px;height:100px;z-index:21;"
        id="sp_hello"
      >
        Countdown until eclipse begins
      </p>
    </div>

    <SearchBox class="searchbox" />
    <Chart class="chart" />
    <News class="news" />
  </div>
</template>

<script>
Date.prototype.Format = function(fmt) {
  //author: meizz
  var o = {
    "M+": this.getMonth() + 1, //月份
    "d+": this.getDate(), //日
    "h+": this.getHours(), //小时
    "m+": this.getMinutes(), //分
    "s+": this.getSeconds(), //秒
    "q+": Math.floor((this.getMonth() + 3) / 3), //季度
    S: this.getMilliseconds() //毫秒
  };
  if (/(y+)/.test(fmt))
    fmt = fmt.replace(
      RegExp.$1,
      (this.getFullYear() + "").substr(4 - RegExp.$1.length)
    );
  for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt))
      fmt = fmt.replace(
        RegExp.$1,
        RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length)
      );
  return fmt;
};

import SearchBox from "@/components/SearchBox.vue";
import Chart from "@/components/Chart.vue";
import News from "@/components/News.vue";
import EventBus from "@/EventBus.js";
import { loadModules } from "esri-loader";

export default {
  name: "Home",
  components: {
    SearchBox,
    Chart,
    News
  },
  data() {
    return {
      daojishi: [],
      map: null
    };
  },
  mounted() {
    EventBus.$emit("router_change", "Search");
    loadModules(["esri/Map", "esri/views/MapView"], { css: true }).then(
      ([Map, MapView]) => {
        const map = new Map({
          basemap: "topo-vector"
        });
        this.view = new MapView({
          container: this.$el,
          map: map,
          center: [-118.63, 34.1],
          zoom: 12
        });
      }
    );
    // eslint-disable-next-line no-undef

    document
      .getElementsByClassName("mapboxgl-ctrl-top-left")[0]
      .setAttribute("style", "top:60px;z-index:20");
    setInterval(() => {
      var time = new Date(
        new Date("2020-6-21 11:45:58").getTime() - new Date().getTime()
      );
      this.daojishi = [
        time.getDate() < 10 ? "0" + time.getDate() : time.getDate(),
        time.getHours() < 10 ? "0" + time.getHours() : time.getDate(),
        time.getMinutes() < 10 ? "0" + time.getMinutes() : time.getMinutes(),
        time.getSeconds() < 10 ? "0" + time.getSeconds() : time.getSeconds()
      ];
    }, 1000);
  }
};
</script>

<style lang="scss">
#map {
  position: absolute;
  top: 0;
  bottom: 0;
  width: 100%;
}
.datetext {
  font-size: 30px;
  text-align: center;
  font-weight: 100;
}
.mapboxgl-ctrl-top-left {
  top: 100px;
}
.searchbox {
  position: absolute;
  left: 30%;
  top: 47%;
  z-index: 22;
}
.chart {
  // position: absolute;
  // right: 10px;
  // top: 10px;
  // background-color: white;
  // opacity: 0.8;
  // border-radius: 10px;
  z-index: 22;
}
.news {
  // position: absolute;
  // right: 10px;
  // bottom: 10px;
  z-index: 23;
}
</style>
