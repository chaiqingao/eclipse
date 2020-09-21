<template>
  <div>
    <div @click="open_dialog" class="sharebtn">
      <i
        class="el-icon-arrow-right"
        style="position:absolute;top:30%;font-size:40px;left:10px;color:white"
      ></i>
    </div>
    <el-drawer
      title="有什么新鲜事想告诉大家？"
      :before-close="handleClose"
      :visible.sync="dialog"
      direction="ltr"
      custom-class="demo-drawer"
      ref="drawer"
      style="z-index: 99;"
    >
      <div class="demo-drawer__content">
        <el-form :model="form">
          <el-form-item
            label="昵称"
            :label-width="formLabelWidth"
            prop="name"
            :rules="[
              { required: true, message: '请输入昵称', trigger: 'blur' }
            ]"
          >
            <el-input
              v-model="form.name"
              autocomplete="off"
              placeholder="请输入昵称"
              style="width:90%"
            ></el-input>
          </el-form-item>
          <el-form-item
            prop="email"
            label="邮箱"
            :label-width="formLabelWidth"
            :rules="[
              { required: true, message: '请输入邮箱', trigger: 'blur' },
              {
                type: 'email',
                message: '请输入正确的邮箱地址',
                trigger: ['blur', 'change']
              }
            ]"
          >
            <el-input
              v-model="form.email"
              autocomplete="off"
              placeholder="请输入邮箱"
              style="width:90%"
            ></el-input>
          </el-form-item>
          <el-form-item
            prop="content"
            :rules="[
              { required: true, message: '请输入内容', trigger: 'blur' }
            ]"
          >
            <el-input
              type="textarea"
              v-model="form.content"
              :autosize="{ minRows: 10, maxRows: 15 }"
              maxlength="300"
              show-word-limit
              placeholder="请输入内容"
              style="width:90%"
            ></el-input>
          </el-form-item>
          <el-upload
            class="upload-demo"
            action="api/postscripts/ImageUpload"
            :file-list="fileList"
            list-type="picture"
            :limit="2"
          >
            <el-button size="small" type="primary">上传图片</el-button>
            <div slot="tip" class="el-upload__tip">
              只能上传jpg/png文件，且不超过两张
            </div>
          </el-upload>
        </el-form>
        <div
          style="position: absolute;bottom:20px;width:100%;text-align:center;"
        >
          <el-button
            type="primary"
            @click="$refs.drawer.closeDrawer()"
            :loading="loading"
            >{{ loading ? "提交中 ..." : "上 传" }}</el-button
          >
          <el-button @click="cancelForm">取 消</el-button>
        </div>
      </div>
    </el-drawer>
  </div>
</template>
<script>
import EventBus from "@/EventBus.js";
export default {
  data() {
    return {
      dialog: false,
      loading: false,
      form: {
        name: "",
        email: "",
        content: ""
      },
      formLabelWidth: "80px",
      timer: null,
      fileList: [],
      pos: []
    };
  },
  created() {
    EventBus.$on("posChange", this.posChange);
  },
  beforeDestroy() {
    EventBus.$off("posChange", this.posChange);
  },
  methods: {
    posChange(pos) {
      this.pos = pos;
    },
    handleClose(done) {
      if (this.loading) {
        return;
      }
      this.$confirm("确定填好了吗？")
        // eslint-disable-next-line no-unused-vars
        .then(_ => {
          this.loading = true;
          this.timer = setTimeout(() => {
            done();
            // 动画关闭需要一定的时间
            setTimeout(() => {
              this.loading = false;
              this.$message({
                message: "上传成功！",
                type: "success",
                center: true
              });
            }, 400);
          }, 2000);
        })
        // eslint-disable-next-line no-unused-vars
        .catch(_ => {});
    },
    cancelForm() {
      this.loading = false;
      this.dialog = false;
      clearTimeout(this.timer);
    },
    open_dialog() {
      if (this.pos.length == 0) {
        this.$message({
          message: "请先获取定位",
          type: "warning"
        });
        return;
      }
      this.dialog = true;
    }
  }
};
</script>
<style lang="scss">
.sharebtn {
  cursor: pointer;
  z-index: 15;
  position: absolute;
  left: 0px;
  top: 43%;
  height: 14%;
  width: 50px;
  background-color: rgba(100, 191, 255, 0.5);
  text-align: center;
}
.sharebtn:hover {
  background-color: rgba(100, 191, 255, 0.8);
}
</style>
