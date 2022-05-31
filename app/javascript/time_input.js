window.addEventListener('load',()=>{
  const timeInput = document.getElementById("time_input");
  const targetTable = document.getElementById("target-table");
  const rows = targetTable.querySelectorAll('tr');

  // const reseveIndex = document.querySelectorAll(".reserve_index");
  // const timeIndex = document.querySelectorAll(".time_index")

  const startTimeInput = document.getElementById("start_time_input");
  const dateInput = document.getElementById("date_input");

  

  rows.forEach((row)=>{
    row.addEventListener('click',()=>{
      console.log(row) 
      const timeConvert = (conversion)=>{
        time = new Date(conversion);
        time.setHours(time.getHours()+9);
        return time.toLocaleString().slice(0,-3)
      };
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
