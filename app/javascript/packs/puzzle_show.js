import Vue from 'vue'
import PuzzleShow from '../puzzle_show.vue'

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    render: h => h(PuzzleShow)
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})