ready = ->
  template = JST["cart/main"]()
  $('#navbar-right').append(template)


$(document).ready(ready)
$(document).on('page:load', ready)