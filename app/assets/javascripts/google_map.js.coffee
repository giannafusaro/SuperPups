googleMap = do ->
  myLatlng = new (google.maps.LatLng)(37.54575, -122.30755)
  mapCenter = new (google.maps.LatLng)(37.54575, -122.30755)
  mapCanvas = document.getElementById('google-map')
  mapOptions =
    center: mapCenter
    zoom: 13
    scrollwheel: false
    draggable: true
    disableDefaultUI: true
    mapTypeId: google.maps.MapTypeId.ROADMAP
  map = new (google.maps.Map)(mapCanvas, mapOptions)
  contentString = '<div id="content">' + '<div id="siteNotice">' + '</div>' + '<h1 id="firstHeading" class="firstHeading">Super Pups</h1>' + '<div id="bodyContent"' + '<p>2230 S El Camino Real</p>' + '</div>' + '</div>'
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
        { hue: '#ffff00' }
        { saturation: 30 }
        { lightness: 10 }
      ]
    } ]
    google.maps.event.addListener marker, 'click', ->
      infowindow.open map, marker
      return
    return
 }
