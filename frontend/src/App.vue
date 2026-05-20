<template>
  <div id="app">
    <header>
      <h1>AI编程学习平台</h1>
    </header>
    <main>
      <router-view />
    </main>
  </div>
</template>

<script setup>
// App root component
</script>

<style>
* { margin: 0; padding: 0; box-sizing: border-box; }
body { font-family: system-ui, sans-serif; }
header { background: #333; color: white; padding: 1rem; }
header h1 { font-size: 1.5rem; }
main { padding: 2rem; max-width: 1200px; margin: 0 auto; }
</style>
