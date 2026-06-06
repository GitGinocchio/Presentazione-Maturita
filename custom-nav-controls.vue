<template>
  <button 
    @click="toggleTheme"
    class="icon-btn fixed bottom-5 right-5 z-50 p-2 rounded-full text-white shadow-lg"
    :style="{ backgroundColor: isDark ? 'var(--slidev-theme-background)' : 'white' }"
  >
    {{ isDark ? '☀️' : '🌙' }}
  </button>
</template>

<script setup>
import { useSlideContext, useDarkMode } from '@slidev/client'
import { ref } from 'vue'
const { $slidev } = useSlideContext()

const isDark = ref(true)
$slidev.isDark = isDark.value;

const toggleTheme = () => {
  isDark.value = !isDark.value

  $slidev.isDark = isDark.value;

  document.documentElement.classList.toggle('dark', isDark.value)
  document.documentElement.classList.toggle('light', !isDark.value)
}
</script>