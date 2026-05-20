<template>
  <div class="course">
    <button @click="$router.back()">返回</button>
    <h2>{{ course.title }}</h2>
    <p>{{ course.description }}</p>
    
    <div class="chapters">
      <div v-for="chapter in course.chapters" :key="chapter.id" class="chapter">
        <h3>{{ chapter.title }}</h3>
        <div v-if="chapter.video_url" class="video">
          <iframe :src="chapter.video_url" frameborder="0" allowfullscreen></iframe>
        </div>
        <div v-if="chapter.content" class="content" v-html="chapter.content"></div>
        <button @click="startQuiz(chapter.id)">测验</button>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRoute } from 'vue-router'
import axios from 'axios'

const route = useRoute()
const course = ref({ title: '', description: '', chapters: [] })

onMounted(async () => {
  const res = await axios.get(`/api/courses/${route.params.id}`)
  course.value = res.data
})

function startQuiz(chapterId) {
  // TODO: Quiz component
}
</script>

<style scoped>
.chapter { border: 1px solid #ddd; border-radius: 8px; padding: 1rem; margin: 1rem 0; }
.video iframe { width: 100%; aspect-ratio: 16/9; }
.content { margin: 1rem 0; line-height: 1.6; }
</style>
