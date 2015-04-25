$(document).ready(function() {
  var marker;
  var map;

  function getLatitude() {

    if(document.getElementById('latitude').value.length > 0 ) {
      return document.getElementById('latitude').value
    }
    return 54.43869834845736
  }

  function getLongitude() {
    if(document.getElementById('longitude').value.length > 0 ) {
      return document.getElementById('longitude').value
    }
    return -2.2472353515624945
  }

  function updateMarkerPosition(latLng) {
    var lat = latLng.lat();
    var lng = latLng.lng();
    document.getElementById('latitude').value = lat;
    document.getElementById('longitude').value = lng;
    $('#display-latitude').text(lat);
    $('#display-longitude').text(lng);
  }

  function initialize() {
    var latitude  = getLatitude();
    var longitude = getLongitude();

    var zoom = (latitude == 54.43869834845736 ) ? 5 : 15;

    var latLng = new google.maps.LatLng(latitude,longitude);
    var map = new google.maps.Map(document.getElementById('form-map'), {
      zoom: zoom,
      center: latLng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var marker = new google.maps.Marker({
      position: latLng,
      map: map,
      draggable: true
    });

    google.maps.event.addDomListener(window, "resize", function() {
      var center = map.getCenter();
      google.maps.event.trigger(map, "resize");
      map.setCenter(center);
    });

    // Update current position info.
    updateMarkerPosition(latLng);
    // Add dragging event listeners.
    google.maps.event.addListener(marker, 'drag', function() {
      updateMarkerPosition(marker.getPosition());
    });
  }

 if(document.getElementById('form-map') == null)
    return;

  initialize();
});
