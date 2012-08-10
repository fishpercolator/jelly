$ ->
  setSize = ->
    w = $(window).width()
    if w > 1900
      $('body').removeClass('wide standard narrow extraNarrow').addClass 'extraWide'
    else if w > 1400
      $('body').removeClass('extraWide standard narrow extraNarrow').addClass 'wide'
    else if w > 1000
      $('body').removeClass('extraWide wide narrow extraNarrow').addClass 'standard'
    else if w > 700
      $('body').removeClass('extraWide wide standard extraNarrow').addClass 'narrow'
    else
      $('body').removeClass('extraWide wide standard narrow').addClass 'extraNarrow'
  $(window).resize ->
    setSize()
  setSize()

