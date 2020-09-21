<template>
  <div id="map" class="travel">
    <ScenicSpot style="z-index: 22;" />
    <KuaFu :eclipses="eclipses" style="z-index:22;" />
  </div>
</template>

<script>
import EventBus from "@/EventBus.js";
import ScenicSpot from "@/components/ScenicSpot.vue";
import KuaFu from "@/components/KuaFu.vue";
import { loadModules } from "esri-loader";
export default {
  components: {
    ScenicSpot,
    KuaFu
  },
  data() {
    return {
      da: 1,
      current_text: "",
      map: null,
      graphicsLayer: null,
      polygonGraphic: null,
      bufferGraphic: null,
      scenicspot: [],
      features: [
        "eclipsearray/2020_06_21.json",
        "eclipsearray/2020_12_14.json",
        "eclipsearray/2021_12_04.json",
        "eclipsearray/2024_04_08.json",
        "eclipsearray/2027_08_02.json"
      ],
      eclipses: [
        "2020-06-21",
        "2020-12-14",
        "2021-12-04",
        "2024-04-08",
        "2027-08-02"
      ],
      centers: [
        [136.82122, 16.6178, 0],
        [-67.23479, -40.06934, 0],
        [-140.42215, -71.73785, 0],
        [-78.25867, 43.98782, 0],
        [80.60983, -9.85548, 0]
      ]
    };
  },
  created() {
    EventBus.$on("change_kuafu", this.changeSources);
  },
  beforeDestroy() {
    EventBus.$off("change_kuafu", this.changeSources);
  },
  mounted() {
    EventBus.$emit("router_change", "Travel");
    loadModules(
      ["esri/Map", "esri/views/MapView", "esri/layers/GraphicsLayer"],
      { css: true }
    ).then(([Map, MapView, GraphicsLayer]) => {
      const map = new Map({
        basemap: "topo-vector"
      });
      this.graphicsLayer = new GraphicsLayer();
      map.add(this.graphicsLayer);
      this.view = new MapView({
        container: this.$el,
        map: map,
        center: [120, 30],
        zoom: 3
      });
      this.changeSource("eclipsemetadata/" + this.$route.query.date + ".json");
    });
  },
  watch: {
    current_text: function() {
      var lng = this.current_text.split(",")[0];
      var lat = this.current_text.split(",")[1];
      var sdis = 100000000;
      var sid = 0;
      this.scenicspot.forEach(item => {
        var dis = this.distanceCal(lng, lat, item.longitude, item.latitude);
        if (dis < sdis) {
          sdis = dis;
          sid = item.sid;
        }
      });
      EventBus.$emit("spot_changed", sid - 1);
    }
  },
  methods: {
    distanceCal(lng1, lat1, lng2, lat2) {
      var radLat1 = (lat1 * Math.PI) / 180.0;
      var radLat2 = (lat2 * Math.PI) / 180.0;
      var a = radLat1 - radLat2;
      var b = (lng1 * Math.PI) / 180.0 - (lng2 * Math.PI) / 180.0;
      var s =
        2 *
        Math.asin(
          Math.sqrt(
            Math.pow(Math.sin(a / 2), 2) +
              Math.cos(radLat1) *
                Math.cos(radLat2) *
                Math.pow(Math.sin(b / 2), 2)
          )
        );
      s = s * 6378.137; // EARTH_RADIUS;
      s = Math.round(s * 10000) / 10000;
      return s;
    },
    changeSource(fileName) {
      loadModules(["esri/Graphic", "esri/geometry/geometryEngine"]).then(
        ([Graphic, geometryEngine]) => {
          this.axios.get(fileName).then(response => {
            this.graphicsLayer.remove(this.polygonGraphic);
            this.graphicsLayer.remove(this.bufferGraphic);
            this.polygonGraphic = new Graphic({
              geometry: {
                type: "polygon",
                rings: response.data[0]
              },
              symbol: {
                type: "simple-fill",
                color: [227, 139, 79, 0.8], // orange, opacity 80%
                outline: {
                  color: [255, 255, 255],
                  width: 1
                }
              }
            });
            var bufferGeometry = geometryEngine.geodesicBuffer(
              this.polygonGraphic.geometry,
              1000,
              "miles"
            );
            this.bufferGraphic = new Graphic({
              geometry: bufferGeometry,
              symbol: {
                type: "simple-fill",
                color: [0, 0, 0, 0.2],
                outline: {
                  color: "rgba(0,0,0,.5)",
                  width: 1
                }
              }
            });
            this.graphicsLayer.add(this.bufferGraphic);
            this.graphicsLayer.add(this.polygonGraphic);
          });
        }
      );
    },
    changeSources(index) {
      var data = {
        type: "FeatureCollection",
        features: this.features
      };

      this.map.getSource("trace").setData(data);
      var buffered;
      this.map.flyTo({
        center: this.centers[index],
        zoom: 2.5,
        pitch: 0
      });
      // eslint-disable-next-line no-undef
      buffered = turf.buffer(this.features[index], 3000, {
        units: "kilometers"
      });
      this.map.getSource("traceBuffer").setData(buffered);
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
</style>
