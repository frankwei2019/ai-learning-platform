<template>
  <div class="course">
    <button @click="$router.push('/')" class="back-btn">返回课程列表</button>
    <h2>{{ course.title }}</h2>
    <p class="desc">{{ course.description }}</p>
    
    <div class="chapters">
      <div v-for="chapter in course.chapters" :key="chapter.id" class="chapter-card">
        <h3>{{ chapter.title }}</h3>
        
        <div v-if="chapter.content" class="content markdown-body" v-html="renderMarkdown(chapter.content)"></div>
        
        <div v-if="chapter.questions && chapter.questions.length > 0" class="quiz-section">
          <h4>章节测验</h4>
          <div v-for="q in chapter.questions" :key="q.id" class="question">
            <p><strong>Q: {{ q.question }}</strong></p>
            <div v-if="q.options" class="options">
              <label v-for="(opt, idx) in JSON.parse(q.options)" :key="idx">
                <input type="radio" :name="'q'+q.id" :value="idx"> {{ opt }}
              </label>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import axios from 'axios'

const route = useRoute()
const router = useRouter()
const course = ref({ title: '', description: '', chapters: [] })

onMounted(async () => {
  try {
    const res = await axios.get(`/api/courses/${route.params.id}`)
    course.value = res.data
  } catch (e) {
    console.error(e)
  }
})

function renderMarkdown(text) {
  if (!text) return ''
  return text
    .replace(/\n/g, '<br>')
    .replace(/#{1,6} /g, m => '<b>' + m + '</b>')
    .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
}
</script>

<style scoped>
.course { max-width: 800px; margin: 0 auto; }
.back-btn { background: #666; color: white; border: none; padding: 8px 16px; border-radius: 4px; cursor: pointer; margin-bottom: 1rem; }
h2 { color: #333; margin-bottom: 0.5rem; }
.desc { color: #666; margin-bottom: 2rem; }
.chapter-card { background: #f9f9f9; border-radius: 8px; padding: 1.5rem; margin-bottom: 1rem; }
.chapter-card h3 { color: #2c3e50; margin-bottom: 1rem; }
.content { line-height: 1.8; color: #444; }
.quiz-section { margin-top: 1rem; padding-top: 1rem; border-top: 1px dashed #ddd; }
.quiz-section h4 { color: #e67e22; margin-bottom: 1rem; }
.question { margin-bottom: 1rem; }
.options { margin-top: 0.5rem; }
.options label { display: block; padding: 0.5rem; cursor: pointer; }
.options label:hover { background: #eee; }
</style>
