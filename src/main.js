import Vue from "vue";
import App from "./App.vue";
import router from "./router";
import ElementUI from "element-ui";
import "element-ui/lib/theme-chalk/index.css";
import axios from "axios";
import VueAxios from "vue-axios";
import VCharts from "v-charts";
import x2js from "x2js";

Vue.config.productionTip = false;

Vue.prototype.$x2js = new x2js();

Vue.use(ElementUI);
Vue.use(VueAxios, axios);
Vue.use(VCharts);

new Vue({
  router,
  render: h => h(App)
}).$mount("#app");
