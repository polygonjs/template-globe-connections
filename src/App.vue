<script setup lang="ts">
import Scene01 from "./polygonjs/components/Scene01.vue";
</script>

<template>
  <Scene01 msg="Vite + Vue" />
  <div class="title-container">
    <div class="title">We are connected</div>
  </div>
</template>

<style scoped>
.title-container {
  position: absolute;
  top: 0px;
  left: 0px;
  height: 100%;
  display: block;
  pointer-events: none;
}
.title-container .title {
  position: absolute;
  top: 50%;
  transform: translate(0%, -50%);
  margin-left: 4rem;
  font-size: 3rem;
  color: #ccc;
}
</style>
