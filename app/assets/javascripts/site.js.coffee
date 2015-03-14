$(document).ready ->


  parallax = ->
    # note: most browsers presently use prefixes: webkitTransform, mozTransform etc.
    offset = $('#featured-testimonial').offset().top - $(window).scrollTop()
    transform = "translate3d(0px, #{-(offset*0.35)}px, 0px)"
    $('#featured-testimonial-background')[0].style.transform = transform

  $(window).scroll (e) ->
    window.requestAnimationFrame(parallax)

  googleMap = do ->
    myLatlng = new (google.maps.LatLng)(37.54575, -122.30755)
    mapCenter = new (google.maps.LatLng)(37.549953, -122.3068106174469)
    mapCanvas = document.getElementById('google-map')
    mapOptions =
      center: mapCenter
      zoom: 13
      scrollwheel: false
      draggable: true
      disableDefaultUI: true
      mapTypeId: google.maps.MapTypeId.ROADMAP
    map = new (google.maps.Map)(mapCanvas, mapOptions)
    contentString = '<div id="content">' + '<div id="siteNotice">' + '</div>' + '<h1 id="firstHeading" class="firstHeading">Super Pups</h1>' + '<div id="bodyContent"' + '<p>2230 S El Camino Real</p>' + '</div>' + '<img src="assets/store-front-thumb.jpg"></img>' +'</div>'
    infowindow = new (google.maps.InfoWindow)(
      content: contentString
      maxWidth: 300)
    marker = new (google.maps.Marker)(
      position: myLatlng
      map: map
      title: 'Super Pups')
    { init: ->
      map.set 'styles', [ {
        featureType: 'landscape'
        elementType: 'geometry'
        stylers: [
          { gamma: 1}
          { hue: '#fffc04' }
          { saturation: 40 }
          { lightness: 50 }
        ]
      } ]
      google.maps.event.addListener marker, 'click', ->
        infowindow.open map, marker
   }

  googleMap.init()
