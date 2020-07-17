<template>
  <div id="app" class="puzzles-index-page">
    <div class="preview-puzzle">
      <table class="sudoku-table"> 
        <tr v-for="i in 9">
          <td v-for="j in 9">
            {{ filterCurrentPuzzle[i][j] }}
          </td>
        </tr>
      </table>
    </div>
    <ul class="puzzle-cards">
      <li
        v-for="(puzzle, index) in puzzles.question_array" 
        :key="puzzle.id" 
        @click="changePuzzle(index)"
        class="puzzle-card"
      >
        <p>
          レベル{{ index }}
        </p>
        <a href="/puzzles/id" class="btn">Play</a>
      </li>
    </ul>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
      currentPuzzleId: 1,
      puzzles: []
    }
  },
  mounted: function () {
    axios.get("/api/v1/puzzles")
      .then(res => this.puzzles = res.data )
  },
  methods: {
    changePuzzle: function (puzzleId) {
      this.currentPuzzleId = puzzleId
    }
  },
  computed: {
    filterCurrentPuzzle: function () {
      console.log(this.puzzles)
      return this.puzzles[this.currentPuzzleId]
    },
  }
}
</script>

<style scoped>
.puzzles-index-page {
  display: flex;
  height: 100%;
  .preview-puzzle {
    width: 40%;
    height: 100%;
  }
  .puzzle-cards {
    width: 60%;
    height: 100%;
    list-style: none;
    display: flex;
    flex-flow: column;
    align-items: center;
    padding: 100px;
    overflow: scroll;
    .puzzle-card {
      border-top: 1px solid #ccc;
      border-bottom: 1px solid #ccc;
      border-radis: 10px;
      background: linear-gradient(315deg, #263b6f, #b873f76b);
    box-shadow: -20px -20px 60px #24304e, 20px 20px 60px #364a75;
      width: 80%;
      height: 100px;
      margin-bottom: 30px;

      display: flex;
      justify-content: space-around;
      align-items: center;

      p{
        font-size: 26px;
        color: white;
      }
      .btn {
        text-decoration: none;
        font-weight: bold;
        font-size: 37px;
        color: #799dec;
        text-shadow: 0px 4px 2px rgba(0, 0, 0, 0.32), 0px 1px 0px #6182ca, 0px 2px 0px #4f6aa7, 0px 3px 0px #5470ad;
      }
      .btn:active {
        top: 4px;
        text-shadow: none;
      }
    }
  }
}
</style>
