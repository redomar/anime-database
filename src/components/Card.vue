<template>
  <div class="card">
    <a href="#" target="_blank" rel="noopener noreferrer">
      <img src="https://placehold.it/150x250" alt="Anime Poster" />
      <h3>Sample</h3>
    </a>
  </div>
</template>

<style lang="scss" scoped>
.card {
  flex: 1 1 33;
  width: 33%;
  max-width: 33%;
  padding: 0px 0.5rem;
  margin-bottom: 1rem;

  img {
    // width: 100%;
    height: 300px;
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