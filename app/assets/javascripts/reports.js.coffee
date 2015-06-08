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
  $(document).keypress (event) ->
    switch event.which
      when 37, 98, 112 # left, b, p
        window.location = $('#prev').attr('href') if $('#prev').attr('href')
      when 39, 110, 32 # right, n, space
        window.location = $('#next').attr('href') if $('#next').attr('href')

  # Use ImageMapster to ensure image map is correct at any size
  $('#jelly-image').mapster()
  
  # Add datepickers to the appropriate fields
  $('.datepicker').datepicker
      format: 'yyyy-mm-dd'

$(document).ready(report_ready)
$(document).on('page:load', report_ready)

