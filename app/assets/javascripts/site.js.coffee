$(document).ready ->

  parallax = ->
    scrolled = $(window).scrollTop()
    $('#banner').css 'top', -(scrolled * 0.9) + 'px'

  $(window).scroll (e) ->
    parallax()

  window.fbAsyncInit = ->
    console.log("fbAsyncInit")
    FB.init
      appId: '1554821174799057'
      xfbml: true
      version: 'v2.2'
    console.log("FB:", FB)
    FB.api '/{122012001144458}/photos"', (response) ->
      if response and !response.error
        console.log 'Success! response:', response
      console.log 'Error! response:', response


  ((d, s, id) ->
    console.log("d,s,id")
    js = undefined
    fjs = d.getElementsByTagName(s)[0]
    if d.getElementById(id)
      return
    js = d.createElement(s)
    js.id = 1554821174799057
    js.src = '//connect.facebook.net/en_US/sdk.js'
    fjs.parentNode.insertBefore js, fjs
    console.log("fjs", fjs)
  ) document, 'script', 'facebook-jssdk'
