<template>
  <div id="app" class="puzzles-show-page">
    <table class="sudoku-table"> 
      <tr v-for="i in 9">
        <td v-for="j in 9">
          <input
            class="number" 
            v-if="questionPuzzle[i-1][j-1] == 0" 
            :value="currentPuzzleToBlank[i-1][j-1]"
            maxlength="1"
            type="number"
            @change="inputNum"
            v-bind:pos-i="i"
            v-bind:pos-j="j"
          >
          <span class="number defoult-place-number" v-else="">
            {{ questionPuzzle[i-1][j-1] }}
          </span>
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
      ],
      questionPuzzle: []
    }
  },
  created: function () {
    axios.get(`/api/v1/puzzles/${location.pathname.match(/\d+/)[0]}`)
      .then(res => {
        this.currentPuzzle = JSON.parse(JSON.stringify(res.data))
        this.questionPuzzle = JSON.parse(JSON.stringify(res.data))
      })
  },
  methods: {
    inputNum: function(e) {
      const i = Number(e.target.getAttribute("pos-i")) - 1
      const j = Number(e.target.getAttribute("pos-j")) - 1
      const value = Number(e.target.value)
      console.log(value)
      if (value > 0 && value <= 9) {
        this.currentPuzzle[i][j] = value
      } else {
        this.currentPuzzle[i][j] = 0
        e.target.value = ""
      }
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
  input {
    text-align: center;
    border: none;
    &:focus{
      outline: 1px solid rgb(9, 106, 196);
    }
  }
  .number {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 100%;
    border: none;
  }
  .defoult-place-number{
    font-weight: bold;
    background-color: rgb(205, 249, 227)
  }
  input[type="number"]::-webkit-outer-spin-button,
  input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
  }
  input[type="number"] {
    -moz-appearance:textfield;
  }
</style>
