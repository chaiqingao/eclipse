<template>
  <div class="social">
    <div id="map">
      <div style=" position: absolute;bottom: 27px;left: 35%;z-index:21">
        <i
          :class="auto_play ? 'el-icon-video-pause' : 'el-icon-video-play'"
          style="font-size: 50px;cursor:pointer;background-color: #409EFF;color:white;border-radius:50%;"
          @click="auto_play = !auto_play"
        ></i>
      </div>
      <div
        style="width: 100%;position: absolute;bottom: 30px;left: 40%;z-index: 22;"
      >
        <div style="width: 300px;">
          <el-slider
            v-model="current_id"
            :min="0"
            :max="locations.length - 1"
            :step="1"
            show-stops
          >
          </el-slider>
        </div>
      </div>
    </div>
    <Share class="share" />
    <UserShare class="user-share" />
  </div>
</template>

<script>
import Share from "@/components/Share.vue";
import UserShare from "@/components/UserShare.vue";
import EventBus from "@/EventBus.js";
export default {
  components: {
    Share,
    UserShare
  },
  data() {
    return {
      pos: [128.23, 35.46],
      map: null,
      flag: 0,
      locations: [
        {
          camera: {
            center: [121, 31],
            zoom: 12.21,
            pitch: 50
          }
        },
        {
          camera: {
            center: [116, 40],
            bearing: -8.9,
            zoom: 11.68
          }
        },
        {
          camera: {
            center: [114, 30],
            bearing: 25.3,
            zoom: 11.5
          }
        },
        {
          camera: {
            center: [139, 25],
            bearing: 36,
            zoom: 11.37
          }
        },
        {
          camera: {
            center: [113, 23],
            bearing: 28.4,
            zoom: 11.64
          }
        }
      ],
      current_id: 0,
      auto_play: true
    };
  },
  created() {
    EventBus.$on("shareChange", id => {
      this.current_id = id;
    });
  },
  beforeDestroy() {
    EventBus.$off("shareChange", id => {
      this.current_id = id;
    });
  },
  mounted() {
    EventBus.$emit("router_change", "Social");
    this.$notify({
      title: "已获取当前位置",
      message: this.pos[0] + "°E, " + this.pos[1] + "°N",
      type: "success"
    });
    EventBus.$emit("posChange", this.pos);
    // eslint-disable-next-line no-undef
    mapboxgl.accessToken =
      "pk.eyJ1IjoiMzA1NzU4MDI2OCIsImEiOiJjazgyaWM4ZmkxMW5kM2ZvcTY4dGR4amtjIn0.TJrXjIIqVSpQOHM6MS_g6g";
    // eslint-disable-next-line no-undef
    this.map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/mapbox/light-v10",
      center: [121, 31],
      zoom: 9.68
    });
    for (let i = 0; i < this.locations.length; i++) {
      // eslint-disable-next-line no-undef
      new mapboxgl.Marker({ draggable: false })
        .setLngLat(this.locations[i].camera.center)
        .addTo(this.map);
    }

    // eslint-disable-next-line no-undef

    this.map.on("load", () => {
      this.map.flyTo(this.locations[0].camera);
      setInterval(() => {
        if (this.auto_play) {
          this.current_id = (this.current_id + 1) % this.locations.length;
        }
      }, 10000);
    });
    document
      .getElementsByClassName("mapboxgl-ctrl-top-left")[0]
      .setAttribute("style", "top:60px;");
  },
  watch: {
    current_id: function() {
      this.map.flyTo(this.locations[this.current_id].camera);
      EventBus.$emit("user_post_changed", this.current_id);
    }
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
.share {
  position: absolute;
  left: 0px;
  top: 0;
  height: 100%;
}
.user-share {
  position: absolute;
  right: 10px;
  bottom: 10px;
}
</style>
