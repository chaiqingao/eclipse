import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "Home",
    component: Home,
    meta: {
      title: ""
    }
  },
  {
    path: "/search",
    name: "Search",
    component: () => import("../views/Search.vue"),
    meta: {
      title: " | 查询模式"
    }
  },
  {
    path: "/travel",
    name: "Travel",
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import("../views/Travel.vue"),
    meta: {
      title: " | 旅行模式"
    }
  },
  {
    path: "/social",
    name: "Social",
    component: () => import("../views/Social.vue"),
    meta: {
      title: " | 社交模式"
    }
  }
];

const router = new VueRouter({
  routes
});
router.beforeEach((to, from, next) => {
  /* 路由发生变化修改页面title */
  document.title = "羲和" + to.meta.title;
  next();
});
export default router;
