window.addEventListener('load',()=>{
  const switchBtnIndex = document.getElementById("switchbtn-index");
  const switchBtnCalendar = document.getElementById("switchbtn-calendar");
  const reservationIndex = document.getElementById("reservation-index");
  const reservationMonthCalendar = document.getElementById("reservation-month-calendar");
  const switchbtnBoth = document.getElementById("switchbtn-both");
  const reservationIndexTitle = document.getElementById("reservation-index-title");
  const reservationMonthCalendarTitle = document.getElementById("reservation-month-calendar-title");

  // 一覧で表示
  switchBtnIndex.addEventListener('click',()=>{
    reservationMonthCalendar.setAttribute("style", "display:none;");
    reservationMonthCalendarTitle.setAttribute("style", "display:none;");
    reservationIndex.removeAttribute("style", "display:none;");
    reservationIndexTitle.removeAttribute("style", "display:none;");

  });
  // カレンダーのみ表示
  switchBtnCalendar.addEventListener('click',()=>{
    // console.log("switch開始")
    reservationIndex.setAttribute("style", "display:none;");
    reservationIndexTitle.setAttribute("style", "display:none;");
    reservationMonthCalendar.removeAttribute("style", "display:none;");
    reservationMonthCalendarTitle.removeAttribute("style", "display:none;");
  });

  // switchbtnBoth.addEventListener('click',()=>{
  //   reservationIndex.removeAttribute("style", "display:none;");
  //   reservationMonthCalendar.removeAttribute("style", "display:none;");
  // });
});