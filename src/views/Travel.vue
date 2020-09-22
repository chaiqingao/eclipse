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
      [
        "esri/Map",
        "esri/views/MapView",
        "esri/Graphic",
        "esri/layers/GraphicsLayer",
        "esri/widgets/Directions"
      ],
      { css: true }
    ).then(([Map, MapView, Graphic, GraphicsLayer, Directions]) => {
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
      var directionsWidget = new Directions({
        view: this.view,
        routeServiceUrl:
          "https://utility.arcgis.com/usrsvcs/appservices/vnc9qiiza2jeiQUl/rest/services/World/Route/NAServer/Route_World"
      });
      // Adds the Directions widget below other elements in
      // the top right corner of the view
      this.view.ui.add(directionsWidget, {
        position: "top-right",
        index: 2
      });
      this.view.on("click", event => {
        // event is the event handle returned after the event fires.
        this.view.hitTest(event).then(response => {
          var results = response.results.filter(result => {
            return result.graphic.layer === this.graphicsLayer;
          });
          if (results.length == 0) return;
          var graphic = results[0].graphic;
          EventBus.$emit("spot_changed", graphic.attributes.idx);
        });
      });
      this.changeSource("eclipsemetadata/" + this.$route.query.date + ".json");

      this.axios.get("scenicspots.json").then(response => {
        this.scenicspot = response.data;
        for (let i = 0; i < this.scenicspot.length; i++) {
          let item = this.scenicspot[i];
          var point = {
            type: "point",
            longitude: item.longitude,
            latitude: item.latitude
          };
          var simpleMarkerSymbol = {
            type: "picture-marker", // autocasts as new PictureMarkerSymbol()
            url: item.imgSrc,
            width: "64px",
            height: "64px"
          };
          var pointGraphic = new Graphic({
            geometry: point,
            symbol: simpleMarkerSymbol,
            attributes: {
              idx: i
            }
          });

          this.graphicsLayer.add(pointGraphic);
        }
      });

      // var point = {
      //   type: "point",
      //   longitude: -118.80657463861,
      //   latitude: 34.0005930608889
      // };
      // var simpleMarkerSymbol = {
      //   type: "picture-marker", // autocasts as new PictureMarkerSymbol()
      //   url:
      //     "https://static.arcgis.com/images/Symbols/Shapes/BlackStarLargeB.png",
      //   width: "64px",
      //   height: "64px"
      // };

      // var pointGraphic = new Graphic({
      //   geometry: point,
      //   symbol: simpleMarkerSymbol
      // });

      // this.graphicsLayer.add(pointGraphic);
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
    findNearestGraphic(event) {
      return this.view.hitTest(event).then(response => {
        // Get the Trail graphics only
        if (response.results.length) {
          return response.results[0].graphic;
        } else {
          return null;
        }
      });
    },
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
      loadModules(["esri/Graphic", "esri/geometry/geometryEngine"]).then(
        ([Graphic, geometryEngine]) => {
          this.graphicsLayer.remove(this.polygonGraphic);

          for (let i = 0; i < this.features.length; i++) {
            this.graphicsLayer.remove(this.bufferGraphic);
            this.axios.get(this.features[i]).then(response => {
              var TpolygonGraphic = new Graphic({
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
              if (i == index) {
                var bufferGeometry = geometryEngine.geodesicBuffer(
                  TpolygonGraphic.geometry,
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
              }
              this.graphicsLayer.add(TpolygonGraphic);
            });
          }
          var lonlat = this.centers[index];
          var target = [lonlat[0], lonlat[1]];
          this.view.goTo(target, { speedFactor: 6, easing: "linear" });
        }
      );
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
