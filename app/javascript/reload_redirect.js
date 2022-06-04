// function doReloadNoCache() {
//   window.location.reload(true);
//   window.location.href='/';
// }

// window.addEventListener('unload',()=>{
//   // setTimeout(doReloadNoCache,5000);
// });

// window.addEventListener('load',(e)=>{
//   const perfEntries = performance.getEntriesByType("navigation");
//   let type = null;

//   perfEntries.forEach(function(pe){
//     // 読み込みタイプを取得
//     type = pe.type;
//   });

//   // リロードかどうかの判定
//   if(type == 'reload'){
//   window.location.href='/';
//   }
// });


window.addEventListener('beforeunload', function(event) {
  event.preventDefault();
  const XHR = new XMLHttpRequest();
  XHR.open("get", "/", false);
  XHR.send();
  XHR.onload = () => {
    if (XHR.status != 200) {
      window.location.href='/';
      return null;
    };
  };
  event.returnValue = '';
});
