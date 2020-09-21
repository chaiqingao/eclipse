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
    // eslint-disable-next-line no-undef
    mapboxgl.accessToken =
      "pk.eyJ1IjoiMzA1NzU4MDI2OCIsImEiOiJjazgyaWM4ZmkxMW5kM2ZvcTY4dGR4amtjIn0.TJrXjIIqVSpQOHM6MS_g6g";
    // eslint-disable-next-line no-undef
    this.map = new mapboxgl.Map({
      container: "map",
      style: "mapbox://styles/mapbox/light-v10",
      center: [-68.13734351262877, 45.137451890638886],
      zoom: 5
    });
    this.map.on("load", () => {
      this.map.addSource("trace", {
        type: "geojson",
        data: {
          type: "Feature",
          geometry: {
            type: "Polygon",
            coordinates: [[0, 0]]
          }
        }
      });
      this.map.addSource("traceBuffer", {
        type: "geojson",
        data: {
          type: "Feature",
          geometry: {
            type: "Polygon",
            coordinates: [[0, 0]]
          }
        }
      });
      this.map.addLayer({
        id: "maine0",
        type: "fill",
        source: "traceBuffer",
        layout: {},
        paint: {
          "fill-color": "#040",
          "fill-opacity": 0.3
        }
      });
      this.map.addLayer({
        id: "maine1",
        type: "fill",
        source: "trace",
        layout: {},
        paint: {
          "fill-color": "#040",
          "fill-opacity": 0.5
        }
      });
      this.changeSource("eclipsemetadata/" + this.$route.query.date + ".json");
    });
    this.axios.get("scenicspots.json").then(response => {
      this.scenicspot = response.data;
      this.scenicspot.forEach(item => {
        this.map.loadImage(item.imgSrc, (error, image) => {
          if (error) throw error;
          this.map.addImage(item.SName, image);
          this.map.addLayer({
            id: "point" + item.SName,
            type: "symbol",
            source: {
              type: "geojson",
              data: {
                type: "FeatureCollection",
                features: [
                  {
                    type: "Feature",
                    geometry: {
                      type: "Point",
                      coordinates: [item.longitude, item.latitude]
                    }
                  }
                ]
              }
            },
            layout: {
              "icon-image": item.SName,
              "icon-size": 0.25
            }
          });
        });
      });
    });
    for (let i = 0; i < this.features.length; i++) {
      this.axios.get(this.features[i]).then(response => {
        this.features[i] = {
          type: "Feature",
          geometry: {
            type: "Polygon",
            coordinates: response.data
          }
        };
      });
    }
    // eslint-disable-next-line no-undef
    var nav = new mapboxgl.NavigationControl();
    this.map.addControl(nav, "top-right");
    this.map.addControl(
      // eslint-disable-next-line no-undef
      new mapboxgl.GeolocateControl({
        positionOptions: {
          enableHighAccuracy: true
        },
        trackUserLocation: false,
        showUserLocation: true
      }),
      "top-right"
    );
    this.map.addControl(
      // eslint-disable-next-line no-undef
      new MapboxDirections({
        // eslint-disable-next-line no-undef
        accessToken: mapboxgl.accessToken
      }),
      "top-right"
    );
    setInterval(() => {
      if (this.$route.name == "Travel") {
        this.current_text = document.getElementsByTagName("input")[1].value;
      }
    }, 100);
    document
      .getElementsByClassName("mapboxgl-ctrl mapboxgl-ctrl-group")[0]
      .setAttribute("style", "top:15px;right:5px;position:absolute");
    document
      .getElementsByClassName("mapboxgl-ctrl mapboxgl-ctrl-group")[1]
      .setAttribute("style", "top:115px;right:5px;position:absolute");
    document
      .getElementsByClassName("mapboxgl-ctrl-directions mapboxgl-ctrl")[0]
      .setAttribute("style", "top:15px;right:50px;position:absolute");
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
      this.axios.get(fileName).then(response => {
        var data = {
          type: "Feature",
          geometry: {
            type: "Polygon",
            coordinates: response.data
          }
        };
        // eslint-disable-next-line no-undef
        var buffered = turf.buffer(data, 3000, { units: "kilometers" });
        this.map.getSource("trace").setData(data);
        this.map.getSource("traceBuffer").setData(buffered);
      });
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
