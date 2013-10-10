ready = ->
  $('#catergoryslider').flexslider(animation: "slide", prevText: '', nextText: '')

$(document).ready(ready)
$(document).on('page:load', ready)