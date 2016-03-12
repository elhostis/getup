$(document).ready(function(){
// carousel
	$(function() {
		$('.bxslider').bxSlider({
		    infiniteLoop: true,
		    hideControlOnEnd: true,
		    auto: true,
		    pager: true,
		    nextText: '<i class="fa fa-chevron-circle-right fa-3x"></i>',
  			prevText: '<i class="fa fa-chevron-circle-left fa-3x"></i>',
  			pagerCustom: '#bx-pager'
		});

		$('.bxslider2').bxSlider({
		    // infiniteLoop: true,
		    hideControlOnEnd: true,
		    auto: false,
		    pager: true,
		   //  nextText: '<i class="fa fa-chevron-circle-right fa-3x"></i>',
  			// prevText: '<i class="fa fa-chevron-circle-left fa-3x"></i>',
  			pagerCustom: '#bx-pager'
		});

		console.log("bien la");
		// $('.slider1').bxSlider({
	 //    slideWidth: 200,
	 //    minSlides: 2,
	 //    maxSlides: 3,
	 //    slideMargin: 10
	 //  });
	});


});
