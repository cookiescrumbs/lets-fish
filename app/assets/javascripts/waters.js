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

  function addAndOpenInfoWindow(map, marker, content){
     var infowindow = new google.maps.InfoWindow({
      content: content
    });
    infowindow.open(map, marker);
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

    addAndOpenInfoWindow(
      map,
      marker,
      content = "Drag and drop this marker onto the water you'd like to add."
    );

    google.maps.event.addDomListener(window, "resize", function() {
      var center = map.getCenter();
      google.maps.event.trigger(map, "resize");
      map.setCenter(center);
    });

    google.maps.event.addListener(map, 'dragend', function() {
      var center = map.getCenter();
      marker.setPosition(center);

      bounds = map.getBounds();
      northEast  = bounds.getNorthEast();
      southWest  = bounds.getSouthWest();

      var maxNumberOfWaters = null;

      if (map.zoom <= 6) {
        maxNumberOfWaters = 2;
      }

      $.ajax({
        type: 'POST',
        url: '/waters/within_bounding_box',
        data: JSON.stringify({
          'bounds': [southWest.lat(), southWest.lng(), northEast.lat(), northEast.lng()],
          'max_number_of_waters': maxNumberOfWaters
        }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: addWatersToMap,
        failure: function(errMsg) {
            alert(errMsg);
        }
      })

    });

    function addWatersToMap(waters){
      for (i = 0; i < waters.length; i++) {
        var latLng = new google.maps.LatLng(waters[i]['latitude'],waters[i]['longitude']);
        new google.maps.Marker({
          position: latLng,
          map: map,
          draggable: false
        });
      }
    }

    google.maps.event.addListener(map, 'zoom_changed', function() {
      var center = map.getCenter();
      marker.setPosition(center);
    });

    // Update current position info.
    updateMarkerPosition(latLng);
    // Add dragging event listeners.
    google.maps.event.addListener(marker, 'drag', function() {
      updateMarkerPosition(marker.getPosition());
    });

  // Create the search box and link it to the UI element.
  var input = (document.getElementById('map-search-box'));
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
  var searchBox = new google.maps.places.SearchBox((input));

  // Listen for the event fired when the user selects an item from the
  // pick list. Retrieve the matching places for that item.
  google.maps.event.addListener(searchBox, 'places_changed', function() {

    var places = searchBox.getPlaces();

    if (places.length <= 0) {
      return;
    }
    // get the first selected result if there are multiple matches
    var firstResult = places[0];
    var bounds = new google.maps.LatLngBounds();
    bounds.extend(firstResult.geometry.location);
    map.fitBounds(bounds);
    map.setZoom(15);
  });

  }

 if(document.getElementById('form-map') == null)
    return;

  initialize();
});
