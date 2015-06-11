# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

report_ready = ->
  for n in [1..23]
    do (n) ->
      $("#jelly-#{n}").click -> 
        $('#jelly-image').attr 'src', "/assets/jelly_babies/#{n}.png"
        $('.mapster_el').attr 'src', "/assets/jelly_babies/#{n}.png"
        $('#report_jelly').val(n)
  $('#report_jelly').change ->
    n = $(this).val()
    $("#jelly-#{n}").click()

  # Use ImageMapster to ensure image map is correct at any size
  $('#jelly-image').mapster()
  
  # Add datepickers to the appropriate fields
  $('.datepicker').datepicker
      format: 'yyyy-mm-dd'

$(document).ready(report_ready)
$(document).on('page:load', report_ready)

