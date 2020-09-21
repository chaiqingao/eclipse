<template>
  <div class="searchbox">
    <el-date-picker
      v-model="date"
      type="date"
      placeholder="选择日期"
      style="width: 90%;"
    >
    </el-date-picker>
    <el-tooltip
      class="item"
      effect="dark"
      content="选择日期搜索附近的日食~"
      placement="right"
    >
      <el-button
        type="primary"
        plain
        icon="el-icon-search"
        @click="search"
        style="width:60px"
      ></el-button>
    </el-tooltip>
    <transition name="el-zoom-in-top">
      <el-timeline
        v-show="eclipses.length != 0"
        :reverse="true"
        style="
  background-color: rgba(235, 245, 249, 0.9);padding-top:20px"
      >
        <el-timeline-item
          v-for="(eclipse, index) in eclipses"
          :key="index"
          :timestamp="eclipse.date.Format('yyyy-MM-dd')"
          :hide-timestamp="true"
          icon="el-icon-sunny"
          size="large"
          style="width: 100px; margin: 10px;"
        >
          <span class="timeline" @click="jump(eclipse.date)">{{
            eclipse.date.Format("yyyy-MM-dd")
          }}</span>
        </el-timeline-item>
      </el-timeline>
    </transition>
    <label v-show="eclipses.length == 0"></label>
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
export default {
  data() {
    return {
      date: null,
      eclipses: []
    };
  },
  methods: {
    search() {
      this.eclipses = [];
      if (this.date == null) {
        this.$message({
          message: "请先输入日期哦~",
          type: "warning",
          center: true
        });
        return;
      }
      this.axios
        .get(
          "api/worldeclipse/queryByDateReturnText/" +
            this.date.getFullYear() +
            "/" +
            (this.date.getMonth() + 1) +
            "/" +
            this.date.getDate()
        )
        .then(response => {
          let dates = response.data;
          try {
            dates = JSON.parse(dates);
          } catch (error) {
            console.log();
          }
          // var datelen=Math.min(dates.length,6);

          for (let i = 0; i < dates.length; i++) {
            let date = new Date(dates[i].date);
            dates[i].date = date;
          }
          this.eclipses = dates.splice(0, 6);
          if (this.eclipses.length == 0) {
            this.$message({
              message: "没有找到您想要的结果诶😅，换个日期试试吧~",
              center: true
            });
          } else {
            this.$message({
              message:
                "已为您搜索到了" +
                this.date.getFullYear() +
                "年" +
                (this.date.getMonth() + 1) +
                "月" +
                this.date.getDate() +
                "日前后的" +
                this.eclipses.length +
                "条结果，点击结果查看详细信息吧😋！",
              type: "success",
              center: true
            });
          }
        });
    },
    jump(date) {
      this.$router.push({
        name: "Travel",
        query: {
          date: date.Format("yyyy_MM_dd")
        }
      });
    }
  }
};
</script>
<style lang="scss">
.searchbox {
  width: 600px;
}
.timeline {
  cursor: pointer;
}
.timeline:hover {
  color: #409eff;
}
</style>
