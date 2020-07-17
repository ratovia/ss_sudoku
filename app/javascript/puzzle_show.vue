<template>

  <table class="sudoku" data-command="sudoku" data-id="2964">
    <tbody>
      <tr class="border-top">
        <td class="fill border-left">2</td>
        <td class="fill">5</td>
        <td class="empty border-right focus"></td>
        <td class="empty"></td>
        <td class="empty"></td>
        <td class="empty border-right"></td>
        <td class="empty"></td>
        <td class="empty"></td>
        <td class="empty border-right"></td>
      </tr>
      <tr>
        <td class="empty border-left"></td>
        <td class="empty"></td>
        <td class="empty border-right"></td>
        <td class="empty"></td>
        <td class="fill">1</td>
        <td class="empty border-right"></td>
        <td class="fill">6</td>
        <td class="fill">2</td>
        <td class="fill border-right">9</td>
      </tr>
      <tr class="border-bottom">
        <td class="empty border-left"></td>
        <td class="empty"></td>
        <td class="fill border-right">6</td>
        <td class="empty"></td>
        <td class="fill">8</td>
        <td class="empty border-right"></td>
        <td class="empty"></td>
        <td class="fill">5</td>
        <td class="fill border-right">1</td>
      </tr>
      <tr>
        <td class="fill border-left">5</td>
        <td class="fill">1</td>
        <td class="fill border-right">2</td>
        <td class="empty"></td>
        <td class="fill">6</td>
        <td class="fill border-right">7</td>
        <td class="fill">9</td>
        <td class="empty"></td>
        <td class="empty border-right"></td>
      </tr>
      <tr>
        <td class="empty border-left"></td>
        <td class="empty" ></td>
        <td class="empty border-right"></td>
        <td class="empty"></td>
        <td class="empty"></td>
        <td class="empty border-right"></td>
        <td class="empty"></td>
        <td class="fill">4</td>
        <td class="fill border-right">5</td>
      </tr>
      <tr class="border-bottom">
        <td class="empty border-left"></td>
        <td class="empty" ></td>
        <td class="fill border-right">7</td>
        <td class="fill">8</td>
        <td class="empty" ></td>
        <td class="fill border-right">3</td>
        <td class="empty" ></td>
        <td class="empty" ></td>
        <td class="empty border-right" ></td>
      </tr>
      <tr>
        <td class="fill border-left">1</td>
        <td class="fill">2</td>
        <td class="empty border-right" ></td>
        <td class="fill">3</td>
        <td class="empty" ></td>
        <td class="empty border-right" ></td>
        <td class="empty" ></td>
        <td class="empty" ></td>
        <td class="empty border-right" ></td>
      </tr>
      <tr>
        <td class="empty border-left"></td>
        <td class="empty"></td>
        <td class="empty border-right"></td>
        <td class="fill">6</td>
        <td class="fill">4</td>
        <td class="empty border-right"></td>
        <td class="fill">1</td>
        <td class="empty" ></td>
        <td class="empty border-right"></td>
      </tr>
      <tr class="border-bottom">
        <td class="empty border-left"></td>
        <td class="fill">4</td>
        <td class="fill border-right">3</td>
        <td class="fill">5</td>
        <td class="empty" ></td>
        <td class="empty border-right" ></td>
        <td class="fill">9</td>
        <td class="empty"></td>
        <td class="fill border-right">7</td>
      </tr>
    </tbody>
  </table>
  
</template>

<script>
export default {
  
}
</script>

<style>
  table {
    border-collapse:collapse;
    border: solid;
    background: #fff;
  }

  td {
    border: 1px solid #3333;
    text-align: center;
  }

  .sudoku {
    width: 500px;
    height: 500px;
    margin: auto;
  }

  .border-bottom {
    border-bottom: solid;
  }

  .border-right {
    border-right: solid;
  }

</style>