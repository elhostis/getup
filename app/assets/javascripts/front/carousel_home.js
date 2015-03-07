$(document).ready(function(){
// carousel
  $(function() {
    $('.bxslider').bxSlider({
        infiniteLoop: true,
        auto: true,
        pager: false,
        controls: false,
        mode: 'fade'
    });
  });

  $("#home_news").als({
    visible_items: 2,
    scrolling_items: 10,
    orientation: "horizontal",
    circular: "yes",
    autoscroll: "yes",
    interval: 5000
  });


});
