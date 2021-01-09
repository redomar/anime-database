<template>
  <div class="card">
    <a :href="anime.url" target="_blank" rel="noopener noreferrer">
      <img :src="anime.image_url" :alt="anime.title + ' Poster'" />
      <h3>{{ anime.title }}</h3>
    </a>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'
export default defineComponent({
  name: 'Card',
  props: ['anime']
})
</script>

<style lang="scss" scoped>
.card {
  flex: 1 1 33;
  width: 13rem;
  margin: 0 auto;
  // min-width: 11%;
  // max-width: 23%;
  padding: 0px 0.5rem;
  margin-bottom: 1rem;

  img {
    width: 100%;
    // height: 300px;
    object-fit: cover;
    border-radius: 0.5rem;
    box-shadow: 0px 4px 8px rgba($color: #0070f3, $alpha: 0.15);
    transition: 0.4s;
  }

  h3 {
    padding: 0.6rem;
    color: #0070f3;
    transition: 0.4s;
  }

  &:hover {
    img {
      transform: scale(1.04);
    }
    h3 {
      color: #0b35db;
    }
  }
}
</style>
