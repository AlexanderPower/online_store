$(window).load ->
  $("input[type=checkbox]").on "click", ->
    console.log $( "input:checked" ).length
#  $("#item_photos_attributes_0_image").on "change", (event) ->
#    files = event.target.files
#    image = files[0]
#    reader = new FileReader()
#    reader.onload = (file) ->
#      img = new Image()
#      console.log file
#      img.src = file.target.result
#      $("#target").html img
#
#    reader.readAsDataURL image
#    console.log files

jQuery ->
  $('.best_in_place').best_in_place()
#  console.log 'best_in_place'