################################################################
# Parallax Scrolling
#   Notes:
#     Target Parallax element should be of fixed position,
#     just inside the body tag.
#
################################################################

class Parallax
  @lastScroll = 0
  @ticking = false

  constructor: (parallaxWindow, parallaxImage) ->
    @parallax =
      window: parallaxWindow
      image: parallaxImage[0]
      speed: 2
    @height = verge.viewportH()

    @rafPolyfill()               # Polyfill for requestAnimationFrame
    window.onscroll = @doScroll  # Add onScroll event listener

  # Get the actual document position
  getPosition: (element) ->
    position = 0
    while element
      position += element.offsetTop - element.scrollTop + element.clientTop
      element = element.offsetParent
    position

  # Update background position
  updatePosition: =>
    value = Math.round((-@lastScroll) / @parallax.speed)        # Distance to move target
    console.log "value: ", value
    @translate(@parallax.image, value)              # Perform the translation
    @ticking = false                                # Stop ticking

  # Translate element using translate3d to ensure GPU rendering
  translate: (element, value) ->
    translation = 'translate3d(0px,' + value + 'px, 0px)'
    element.style['-webkit-transform'] = translation
    element.style['-moz-transform'] = translation
    element.style['-ms-transform'] = translation
    element.style['-o-transform'] = translation
    element.style.transform = translation

  # Limit position calculation to 60fps and prevent running multiple times at once
  requestTick: ->
    if !@ticking
      window.requestAnimationFrame(@updatePosition)
      @ticking = true

  # Update scroll value and request tick
  doScroll: =>
    if verge.inY(@parallax.window)
      @offset = @parallax.window.offset().top - @height
      @lastScroll = verge.scrollY() - @offset - (@height-5)
      @requestTick()

  # RequestAnimationFrame polyfill for older browsers
  rafPolyfill: =>
    lastTime = 0
    vendors = ['webkit','moz']
    x = 0

    while x < vendors.length and !window.requestAnimationFrame
      window.requestAnimationFrame = window[vendors[x]+'RequestAnimationFrame']
      window.cancelAnimationFrame = window[vendors[x]+'CancelAnimationFrame'] or window[vendors[x]+'CancelRequestAnimationFrame']
      ++x

    if !window.requestAnimationFrame
      window.requestAnimationFrame = (callback, element) ->
        currTime = (new Date).getTime()
        timeToCall = Math.max(0, 16-(currTime-lastTime))
        id = window.setTimeout((-> callback currTime + timeToCall), timeToCall)
        lastTime = currTime + timeToCall
        id

    if !window.cancelAnimationFrame
      window.cancelAnimationFrame = (id) ->
        clearTimeout id

###############################
# Init
###############################

$(document).ready ->
  if $(window).width() > 768
    new Parallax $('#featured-testimonial'), $('#featured-testimonial-background')
