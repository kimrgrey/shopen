check_gototop_position = ->
  if $(this).scrollTop() > 50 
    $('#gotop').fadeIn(500);
  else
    $('#gotop').fadeOut(500);

ready = ->
  $(window).scroll ->
    check_gototop_position()
      
  $('#gotop').click ->
    $('html, body').animate {scrollTop: 0}, 2200

  check_gototop_position()

$(document).ready(ready)
$(document).on('page:load', ready)