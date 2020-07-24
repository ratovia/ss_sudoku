<template>
  <div id="app" class="puzzles-index-page">
    <div class="preview-puzzle">
      <table class="sudoku-table"> 
        <tr v-for="i in 9">
          <td v-for="j in 9">
            {{ currentPuzzleToBlank[i-1][j-1] }}
          </td>
        </tr>
      </table>
    </div>
    <ul class="puzzle-cards">
      <li
        v-for="puzzle in puzzles" 
        :key="puzzle.id" 
        @mouseover="changePuzzle(puzzle.id)"
        v-bind:class="{selected:currentPuzzleId===puzzle.id}"
        class="puzzle-card"
      >
        <p>
          レベル{{ index }}
        </p>
        <a v-bind:href="'/puzzles/'+index" class="btn">Play</a>
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
      puzzles: [],
      currentPuzzle: [
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0],
        [0,0,0,0,0,0,0,0,0]
      ]
    }
  },
  created: function () {
    axios.get("/api/v1/puzzles")
      .then(res => this.puzzles = res.data )
  },
  methods: {
    changePuzzle: function (puzzleId) {
      this.currentPuzzleId = puzzleId 
      axios.get(`/api/v1/puzzles/${puzzleId}`)
        .then(res => this.currentPuzzle = res.data)
    }
  },
  computed: {
    currentPuzzleToBlank: function () {
      return this.currentPuzzle.map(function(tr){
        return tr.map(function(td){
          if (td == 0) {return ""}
          return td
        })
      })
    }
  }
}
</script>

<style lang="scss">
.puzzles-index-page {
  display: flex;
  height: 100%;
  .preview-puzzle {
    width: 50%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    table {
      padding: 60px;
      border-collapse: collapse;
      border: solid;
      background: #fff;
    }

    td {
      width: 50px;
      height: 50px;
      border: 1px solid #3333;
      text-align: center;
    }

    tr:nth-child(3),tr:nth-child(6) {
      border-bottom: solid;
    }

    td:nth-child(3),td:nth-child(6) {
      border-right: solid;
    }
  }
  .puzzle-cards {
    width: 50%;
    height: 100%;
    list-style: none;
    display: flex;
    flex-flow: column;
    align-items: center;
    padding: 100px 50px;
    overflow: scroll;
    
    .puzzle-card {
      border-top: 1px solid #888;
      border-bottom: 1px solid #888;
      background: linear-gradient(315deg, #263b6f, #b873f76b);
      height: 100px;
      border-radis: 10px;
      width: 100%;
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
    .selected{
      background: linear-gradient(315deg, #263b6f, #73f7836b);
    }
  }

  
}
</style>
