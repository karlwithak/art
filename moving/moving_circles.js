function change(evt) {
  var target = document.getElementById('circle')
  var radius = target.getAttribute("r");

  target.setAttribute("fill", "red");
  console.log("test");
}
