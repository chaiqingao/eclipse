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
      pointGraphicsLayer: null,
      polygonGraphic: null,
      bufferGraphics: [],
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
      ],
      colorTable: [
        [221, 89, 42, 0.2],
        [240, 140, 63, 0.2],
        [245, 162, 68, 0.2],
        [255, 214, 110, 0.2],
        [255, 247, 225, 0.2]
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
      this.pointGraphicsLayer = new GraphicsLayer();
      map.add(this.graphicsLayer, -1);
      map.add(this.pointGraphicsLayer, 100);
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
            return result.graphic.layer === this.pointGraphicsLayer;
          });
          if (results.length == 0) return;
          var graphic = results[0].graphic;
          if (graphic.attributes == null) return;
          EventBus.$emit("spot_changed", graphic.attributes.idx);
        });
        try {
          let date = this.$route.query.date;
          date = date.replaceAll("_", "");
          let point = event.mapPoint;
          let lon = point.longitude;
          let lat = point.latitude;
          this.axios
            .get("api/eclipsePointInfo/" + date + "/" + lon + "/" + lat)
            .then(response => {
              var data = response.data;
              this.view.popup.open({
                title: data.name == undefined ? "Nowhere" : data.name,
                content: this.getContent(data),
                location: event.mapPoint,
                actions: []
              });
            });
        } catch (error) {
          console.log();
        }
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

          this.pointGraphicsLayer.add(pointGraphic);
        }
      });
    });
  },
  methods: {
    getContent(info) {
      var first = "<div style='text-align:left;'>";
      var last = "</div>";
      if (info.solar == 0)
        return first + "<h1>无法观测到此次日食😭</h1>" + last;
      first +=
        "<h1>" +
        (info.visibility == "Partial solar eclipse visible"
          ? "可以观测到日偏食😀"
          : "可以观测到日全食😁") +
        "，时长：" +
        info.duration.fmt
          .replaceAll("s", "")
          .replaceAll(",", "")
          .replaceAll(" ", "")
          .replace("hour", "小时")
          .replace("minute", "分")
          .replace("econd", "秒") +
        "</h1>";
      console.log(info);
      first += "<ul>";
      info.events.forEach(item => {
        first += "<li><h3>";
        switch (item.type) {
          case "p1":
            first += "初亏";
            break;
          case "u1":
            first += "食既";
            break;
          case "mx":
            first += "食甚";
            break;
          case "ss":
            first += "日落";
            break;
          case "sr":
            first += "日出";
            break;
          case "u4":
            first += "生光";
            break;
          case "p4":
            first += "复圆";
            break;
        }
        first += "：" + item.txt + "</h3></li>";
      });
      first += "</ul>";
      first +=
        "<p>*自2000年以来，这天有" +
        info.weather.cloud_avg +
        "%的时间多云~" +
        "</p>";
      return first + last;
    },
    changeSource(fileName) {
      loadModules(["esri/Graphic"]).then(([Graphic]) => {
        this.axios.get(fileName).then(response => {
          this.graphicsLayer.remove(this.polygonGraphic);
          this.polygonGraphic = new Graphic({
            geometry: {
              type: "polygon",
              rings: response.data[0]
            },
            symbol: {
              type: "simple-fill",
              color: [208, 1, 27, 0.2],
              outline: {
                width: 0
              }
            }
          });
          this.drawBuffer(this.polygonGraphic.geometry);
          this.graphicsLayer.add(this.polygonGraphic);
        });
      });
    },
    drawBuffer(geometry) {
      loadModules(["esri/Graphic", "esri/geometry/geometryEngine"]).then(
        ([Graphic, geometryEngine]) => {
          this.bufferGraphics.forEach(item => {
            this.graphicsLayer.remove(item);
          });
          this.bufferGraphics = [];
          for (let i = 5; i > 0; i--) {
            var bufferGraphic = new Graphic({
              geometry: geometryEngine.geodesicBuffer(
                geometry,
                i * 500,
                "miles"
              ),
              symbol: {
                type: "simple-fill",
                color: this.colorTable[5 - i],
                outline: {
                  width: 0
                }
              }
            });
            this.graphicsLayer.add(bufferGraphic);
            this.bufferGraphics.push(bufferGraphic);
          }
        }
      );
    },
    changeSources(index) {
      loadModules(["esri/Graphic"]).then(([Graphic]) => {
        this.graphicsLayer.remove(this.polygonGraphic);

        var lonlat = this.centers[index];
        var target = [lonlat[0], lonlat[1]];
        this.view.goTo(target, { speedFactor: 6, easing: "linear" });
        for (let i = 0; i < this.features.length; i++) {
          this.axios.get(this.features[i]).then(response => {
            var TpolygonGraphic = new Graphic({
              geometry: {
                type: "polygon",
                rings: response.data[0]
              },
              symbol: {
                type: "simple-fill",
                color: [208, 1, 27, 0.2], // orange, opacity 80%
                outline: {
                  width: 0
                }
              }
            });
            if (i == index) {
              this.drawBuffer(TpolygonGraphic.geometry);
              this.graphicsLayer.add(TpolygonGraphic);
            }
          });
        }
      });
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
