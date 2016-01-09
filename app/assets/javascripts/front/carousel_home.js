$(document).ready(function(){
// carousel
  $('.bxslider').bxSlider({
    infiniteLoop: true,
    auto: true,
    pager: false,
    controls: false,
    mode: 'fade'
  });

  $('.bxslider2').bxSlider({
    infiniteLoop: true,
    hideControlOnEnd: true,
    auto: false,
    pager: true,
    nextText: '<i class="fa fa-chevron-circle-right fa-3x"></i>',
    prevText: '<i class="fa fa-chevron-circle-left fa-3x"></i>'
  });

  $("#home_news").als({
    visible_items: 2,
    scrolling_items: 10,
    orientation: "horizontal",
    circular: "yes",
    autoscroll: "no",
    interval: 5000
  });


});
