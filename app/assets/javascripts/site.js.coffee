
parallax = ->
  # TODO: most browsers presently use prefixes: webkitTransform, mozTransform etc.
  offset = $('#featured-testimonial').offset().top - $(window).scrollTop()
  transform = "translate3d(0px, #{-(offset*0.35)}px, 0px)"
  $('#featured-testimonial-background')[0].style.transform = transform

###############################
# Init
###############################

$(document).ready ->

  # Parallax
  $(window).scroll (e) ->
    window.requestAnimationFrame(parallax)

  # Trigger CSS3 Animations
  $('[data-toggle]').on 'click', (event) ->
    target = $(this).data('toggle')
    $(target).toggleClass('active')
