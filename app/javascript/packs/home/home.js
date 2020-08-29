function toggleNav() {
  var body = document.body;
  var hamburger = document.getElementById('nav_btn');
  var blackBg = document.getElementById('nav_bg');

  hamburger.addEventListener('click', function() {
    body.classList.toggle('nav_open'); //メニュークリックでnav-openというクラスがbodyに付与
  });
  blackBg.addEventListener('click', function() {
  body.classList.remove('nav_open'); //もう一度クリックで解除
  });
}
toggleNav();

$(function(){
  setTimeout("$('#flash_box').fadeOut('slow')", 2000);
});