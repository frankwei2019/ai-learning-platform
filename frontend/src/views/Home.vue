<template>
  <div class="home">
    <h2>课程列表</h2>
    <div class="course-grid">
      <div v-for="course in courses" :key="course.id" class="course-card">
        <h3>{{ course.title }}</h3>
        <p>{{ course.description }}</p>
        <router-link :to="`/course/${course.id}`">开始学习</router-link>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import axios from 'axios'

const courses = ref([])

onMounted(async () => {
  const res = await axios.get('/api/courses')
  courses.value = res.data
})
</script>

<style scoped>
.course-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 1rem; margin-top: 1rem; }
.course-card { border: 1px solid #ddd; border-radius: 8px; padding: 1rem; }
.course-card h3 { color: #333; margin-bottom: 0.5rem; }
.course-card p { color: #666; margin-bottom: 1rem; }
</style>
