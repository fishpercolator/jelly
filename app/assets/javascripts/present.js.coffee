$ ->
  setSize = ->
    w = $(window).width()
    if w > 1200
      $('body').addClass 'wide'
    else
      $('body').removeClass 'wide'
  $(window).resize ->
    setSize()
  setSize()

