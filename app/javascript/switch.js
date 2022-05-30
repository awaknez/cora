window.addEventListener('load',()=>{
  const switchBtnIndex = document.getElementById("switchbtn-index");
  const switchBtnCalendar = document.getElementById("switchbtn-calendar");
  const reservationIndex = document.getElementById("reservation-index");
  const reservationMonthCalendar = document.getElementById("reservation-month-calendar");
  const switchbtnBoth = document.getElementById("switchbtn-both");

  switchBtnIndex.addEventListener('click',()=>{
    // console.log("switch開始")
    reservationMonthCalendar.setAttribute("style", "display:none;");
    reservationIndex.removeAttribute("style", "display:none;");
  });
  switchBtnCalendar.addEventListener('click',()=>{
    // console.log("switch開始")
    reservationIndex.setAttribute("style", "display:none;");
    reservationMonthCalendar.removeAttribute("style", "display:none;");
  });

  switchbtnBoth.addEventListener('click',()=>{
    reservationIndex.removeAttribute("style", "display:none;");
    reservationMonthCalendar.removeAttribute("style", "display:none;");
  });
});