$(document).ready(function() {
  $('#login').on('click', function(e) {
    e.preventDefault();
    $(this).css("display", "none");
    $(this).css("top", "-33px");
    $('#fbook').fadeIn();
    $('#google').css('left', '184px');
    $('#google').fadeIn();
  });

  $(window).scroll(function() {
    $(".search").css("top", Math.max(-15, 250 - $(this).scrollTop()));
    if ($(this).scrollTop() > 265) {
      $('#searchhead').fadeIn();
    }
    if ($(this).scrollTop() < 265) {
      $('#searchhead').fadeOut();
    }
  });

    function returnHeaderSearch() {
      $('#searchhead').animate({ right: '-263px' }, 1000);
    }


  $('#searchhead').hover(function() {
    $(this).animate({
      right: '-11px'
    }, 750);
  }, function() {
    setTimeout(function(){
      returnHeaderSearch();
    }, 1000);
  });


  MapsLib.initialize();

  $('section[data-type="background"]').each(function() {
    var $bgobj = $(this); // assigning the object

    $(window).scroll(function() {
      var yPos = -($window.scrollTop() / $bgobj.data('speed'));

      // Put together our final background position
      var coords = '50% ' + yPos + 'px';

      // Move the background
      $bgobj.css({
        backgroundPosition: coords
      });
    });
  });


});