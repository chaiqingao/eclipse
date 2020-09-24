<template>
  <div :id="open ? 'card4' : 'card4-close'">
    <div>
      <div id="card4_text">
        <p id="card4_title">浏览记录</p>
      </div>
    </div>
    <div id="card4_content">
      <div class="kuafu">
        <el-table
          :data="tableDatas[current_id]"
          height="350"
          style="width: 100%;opacity:0.8"
        >
          <el-table-column fixed prop="date" label="日期" width="110px">
          </el-table-column>
          <el-table-column prop="pos" label="位置"> </el-table-column>
          <el-table-column prop="type" label="类型"> </el-table-column>
          <el-table-column prop="duration" label="时长"> </el-table-column>
          <el-table-column prop="mag" label="mag"> </el-table-column>
          <el-table-column prop="pathWidth" label="pathWidth">
          </el-table-column>
          <el-table-column prop="sarosNum" label="sarosNum"> </el-table-column>
          <el-table-column prop="sunAlt" label="sunAlt"> </el-table-column>
        </el-table>
        <div
          style="text-align:center;width:341px;position:absolute;bottom:0px;z-index:20;"
        >
          <el-button
            type="primary"
            @click="current_id--"
            :disabled="current_id == 0"
            >&lt;</el-button
          >
          <!--<el-input
      v-model="eclipses[current_id]"
      :readonly="true"
      style="width:242px;text-align:center;"
    ></el-input>-->
          <el-button style="width:200px;" @click="open = !open">{{
            eclipses[current_id]
          }}</el-button>
          <el-button
            type="primary"
            @click="current_id++"
            :disabled="current_id == eclipses.length - 1"
            style="margin:none"
            >&gt;</el-button
          >
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import EventBus from "@/EventBus.js";
export default {
  props: {
    eclipses: Array
  },
  data() {
    return {
      tableData: [
        {
          date: "2016-05-02",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1518 弄"
        }
      ],
      tableDatas: [],
      current_id: 0,
      open: true
    };
  },
  mounted() {
    this.eclipses.forEach(item => {
      let date = item.split("-");
      this.axios
        .get(
          "api/worldeclipse/queryInKuafu/" +
            date[0] +
            "/" +
            date[1] +
            "/" +
            date[2]
        )
        .then(response => {
          let data = response.data;
          console.log(data);
          var tableData = [];
          data.forEach(item => {
            tableData.push({
              date: item.Year + "-" + item.Month + "-" + item.Day,
              pos: item.Longitude + ", " + item.Latitude,
              type: item.Type,
              duration: item.Duration,
              mag: item.Mag,
              pathWidth: item.PathWidth,
              sarosNum: item.SarosNum,
              sunAlt: item.SunAlt
            });
          });
          this.tableDatas.push(tableData);
        });
    });
  },
  watch: {
    current_id() {
      EventBus.$emit("change_kuafu", this.current_id);
    }
  }
};
</script>

<style lang="scss">
#card4 {
  border: 1px solid grey;
  position: absolute;
  padding: 2px;
  right: 15px;
  bottom: 40px;
  width: 341px;
  height: 56vh;
  overflow: hidden;
  animation: cardLoad2 2s;
}
@keyframes cardLoad2 {
  from {
    height: 10vh;
    // transform:translate3d(0,10%,0);
  }
  to {
    height: 56vh;
    // transform: none;
  }
}
@keyframes cardLoad {
  from {
    height: 56vh;
    // transform:translate3d(0,10%,0);
  }
  to {
    height: 10vh;
    // transform: none;
  }
}
#card4-close {
  border: 1px solid grey;
  position: absolute;
  padding: 2px;
  right: 15px;
  bottom: 40px;
  width: 341px;
  height: 10vh;
  overflow: hidden;
  animation: cardLoad 2s;
}
#card4_text {
  width: 98.5%;
  height: 4vh;
  line-height: 24px;
  background: rgba(100, 191, 255, 0.3);
  padding-left: 2px;
  border-left: 2px solid #64bfff;
}
#card4_text p {
  font-size: 12px;
  color: #000;
  text-align: left;
  margin: 0;
}
#card4_content {
  height: 100%;
  background: rgba(235, 245, 249, 0.6);
}
.kuafu {
  width: 400px;
  height: 400px;
}
.el-input__inner {
  text-align: center;
}
</style>
