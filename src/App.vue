<template>
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link
    href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700;900&display=swap"
    rel="stylesheet"
  />
  <div class="app">
    <header>
      <h1>The<strong>Anime</strong>Database</h1>

      <form class="search-box" @submit.prevent="HandleSearch">
        <input
          type="search"
          class="search-field"
          placeholder="Search for an anime..."
          required
          v-model="searchQuery"
        />
      </form>
    </header>
    <h3 v-if="prevSearch">
      Showing results for <strong>{{ prevSearch }}</strong>
    </h3>
    <main v-if="animeList.length > 0 || !prevSearch">
      <div class="cards">
        <Card v-for="anime in animeList" :key="anime.mal_id" :anime="anime" />
      </div>
    </main>
    <h3 v-else>
      No results for <strong>{{ prevSearch }}</strong>
    </h3>
  </div>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue'
import Card from './components/Card.vue'

export default defineComponent({
  name: 'App',
  setup() {
    const searchQuery = ref('')
    const prevSearch = ref('')
    const animeList = ref([])

    const HandleSearch = async () => {
      animeList.value = await fetch(
        `https://api.jikan.moe/v3/search/anime?q=${searchQuery.value}`
      )
        .then((res) => res.json())
        .then((data) => data.results)
      prevSearch.value = searchQuery.value
      searchQuery.value = ''
    }
    return {
      Card,
      searchQuery,
      animeList,
      prevSearch,
      HandleSearch
    }
  },
  components: {
    Card
  }
})
</script>

<style lang="scss">
// text-shadow: 1px 1px 9px #0070f333;
// color: #0070f3;

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;

  font-family: 'Inter', sans-serif;
}

a,
a:visited {
  color: black;
  text-decoration: none;
}

header {
  padding-top: 3rem;
  padding-bottom: 3rem;

  h1 {
    font-size: 2.6em;
    font-weight: 400;
    text-align: center;
    text-transform: uppercase;
    margin-bottom: 30px;
    // color: #0070f3;
    // text-shadow: 1px 1px 6px #0070f333;
  }

  strong {
    color: #0070f3;
  }

  &:hover {
    cursor: default;
  }

  .search-box {
    display: flex;
    justify-content: center;
    padding-left: 30px;
    padding-right: 30px;

    .search-field {
      appearance: none;
      background: none;
      border: none;
      outline: none;

      background-color: rgba($color: #0070f3, $alpha: 0.1);
      box-shadow: 0px 4px 8px rgba($color: #0070f3, $alpha: 0.15);

      display: block;
      width: 100%;
      max-width: 600px;
      padding: 15px;
      border-radius: 8px;

      &::placeholder {
        color: #13437a;
      }

      &:focus,
      &:valid {
        background: #0cf8f9;
        box-shadow: 0px 0px 0px;
      }
    }
  }
}

h3 {
  padding-left: 3rem;
  font-weight: 300;
  // color: black;
  strong {
    color: #0070f3;
  }
}

main {
  max-width: 75rem;
  margin: 0 auto;
  padding: 30px;
  padding-right: 30px;

  .cards {
    display: flex;
    flex-wrap: wrap;
    margin: 0 -0.5rem;
  }
}
</style>
