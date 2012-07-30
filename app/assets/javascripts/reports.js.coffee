# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  for n in [1..23]
    do (n) ->
      $("#jelly-#{n}").click -> 
        $('#jelly-image').attr 'src', "/assets/jelly_babies/#{n}.png"
        $('.mapster_el').attr 'src', "/assets/jelly_babies/#{n}.png"
        $('#report_jelly').val(n)

# Use ImageMapster to ensure image map is correct at any size
$('#jelly-image').mapster()
