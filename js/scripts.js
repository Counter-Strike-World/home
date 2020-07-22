$(document).ready(function () {
  $(window).bind('scroll', function () {
    if ($(window).scrollTop() > 50) {
        $('#nav').addClass('fixed-nav');
    } else {
        $('#nav').removeClass('fixed-nav');
    }
  });
});
