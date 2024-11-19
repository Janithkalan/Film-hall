var x = document.getElementById("nav-link");
var y = document.getElementById("nav-link2");
function ham(){
    
  if (x.style.display === "flex") {
    x.style.display = "none";
  } else {
    x.style.display = "flex";
  }
}



  function applyStyles() {
    var width = window.innerWidth;
    if (width > 768 ) {
        y.style.display = "flex";
        x.style.display = "none";
      }else {
        y.style.display = "none";
      }
}

applyStyles();

window.addEventListener('resize', applyStyles);