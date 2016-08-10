var pageLimit = 448;

function changeOverlay () {
    var randomNum = Math.round(Math.random() * pageLimit) - 1;
    $('.box:eq(' + randomNum + ')').animate({ "opacity" : Math.random() });
    setTimeout(function() { 
        $('.box:eq(' + randomNum + ')').animate({ "opacity" : Math.random() });
        changeOverlay();
    }, 100);
}

$(document).ready(function() {

	for (var i = 1; i <= pageLimit; i++) {
        var box = $ ('<div />');
		$(box).attr('id', i).addClass('box');  //add thumbnail as bg image and url
		$('#container5').append(box);
    }

    $('.box').on('click', function(e){      //wont be needed
		e.preventDefault();
		for (var i = 1; i <= pageLimit; i++) {
		$(".box").css({ opacity: 1 });
    }
		// changeOverlay();
	});

  $('#container5').masonry({
   // columnWidth: 300,
   itemSelector: '.item'
  })
  // .imagesLoaded(function() {
  //  $('#container5').masonry('reload');
  // });
  changeOverlay();
});

$('#container5').masonry({
   isFitWidth: true,
   isAnimated: true
});

// function changeOverlay () {
//     var randomNum = Math.round(Math.random() * pageLimit) - 1;
//     $('.item:eq(' + randomNum + ')').animate({ "opacity" : Math.random() });
//     setTimeout(function() { 
//         $('.item:eq(' + randomNum + ')').animate({ "opacity" : Math.random() });
//         changeOverlay();
//     }, 10);
// }


