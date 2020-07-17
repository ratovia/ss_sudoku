<template>
  <div id="app" class="puzzles-show-page">
    <table class="sudoku-table"> 
      <tr v-for="i in 9">
        <td v-for="j in 9">
          {{ currentPuzzle[i-1][j-1] }}
        </td>
      </tr>
    </table>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  data: function () {
    return {
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
    axios.get(`/api/v1/puzzles/${location.pathname.match(/\d+/)[0]}`)
      .then(res => this.currentPuzzle = res.data )
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
  table {
    border-collapse:collapse;
    border: solid;
    background: #fff;
  }

  td {
    border: 1px solid #3333;
    text-align: center;
    width: 50px;
    height: 50px;
  }

  .sudoku-table {
    margin: auto;
  }

  tr:nth-child(3),tr:nth-child(6) {
    border-bottom: solid;
  }

  td:nth-child(3),td:nth-child(6) {
    border-right: solid;
  }

</style>