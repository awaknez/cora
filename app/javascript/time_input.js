window.addEventListener('DOMContentLoaded',()=>{
  const timeInput = document.getElementById("time_input");
  const targetTable = document.getElementById("target-table");
  const rows = targetTable.querySelectorAll('tr');

  // const reseveIndex = document.querySelectorAll(".reserve_index");
  // const timeIndex = document.querySelectorAll(".time_index")

  const startTimeInput = document.getElementById("start_time_input");
  const dateInput = document.getElementById("date_input");

  // 取得した全ての行に対してイベント発火できるようにする
  rows.forEach((row)=>{
    row.addEventListener('click',()=>{
      console.log(row) 
       // 再び全ての行を取得する
      const rows2 = targetTable.querySelectorAll('tr');
        // 取得した全ての行の背景色を白色にする
      rows2.forEach((row2)=>{
        row2.setAttribute("style","background-color:white;color:black;");
      })
        // 選択（クリック）した行を色付けする
      row.setAttribute("style","background-color:#C396C3;color:white;")
        // start_timeに値を代入するために時間変換。convasionは関数の中で使うための変数
      const timeConvert = (conversion)=>{
        time = new Date(conversion);
        time.setHours(time.getHours()+9);
        return time.toLocaleString().slice(0,-3)
      };
        // 予約が埋まっていたらバツにする
      if (row.cells[1].innerText == "○"){
        const time =row.cells[0].innerText;
        timeInput.value = time;
        const conversion = dateInput.value + " " +time
        startTimeInput.value = timeConvert(conversion);
      }
      else
        {timeInput.value = "この時間帯は予約できません"
      }
    });
  });
});
