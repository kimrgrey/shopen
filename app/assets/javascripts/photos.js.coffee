ready = ->
  $('#add-product-photo-link').click (event) ->
    event.preventDefault()
    
    false

$(document).ready(ready)
$(document).on('page:load', ready)