$(document).ready(function() {
  var map;
  var markers =[];

  function initialize() {

    var latitude  = 54.43869834845736;
    var longitude =  -2.2472353515624945;

    var zoom = (latitude == 54.43869834845736 ) ? 5 : 15;

    var latLng = new google.maps.LatLng(latitude,longitude);

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: zoom,
      center: latLng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    ///////Responsive map
    google.maps.event.addDomListener(window, "resize", function() {
      var center = map.getCenter();
      google.maps.event.trigger(map, "resize");
      map.setCenter(center);
    });
    ///////////////////////////

    google.maps.event.addListenerOnce(map,'idle', function(){
      addMakersWithInBoundingBox(map);
    });

    google.maps.event.addListener(map, 'dragend', function() {
      removeAndResetMarkers();
      addMakersWithInBoundingBox(map);
    });

    function addMakersWithInBoundingBox(map){
      var bounds = getBoundsFromMap(map);
      getMarkerData(bounds);
    }

    function getBoundsFromMap(map) {
      bounds = map.getBounds();
      northEast  = bounds.getNorthEast();
      southWest  = bounds.getSouthWest();
      return [southWest.lat(), southWest.lng(), northEast.lat(), northEast.lng()];
    }

    function addMarkers(waters){
      for (i = 0; i < waters.length; i++) {
        var latLng = new google.maps.LatLng(waters[i]['latitude'],waters[i]['longitude']);
        var marker = new google.maps.Marker({ position: latLng});
        markers.push(marker);
      }
      var markerCluster = new MarkerClusterer(map, markers);
    }

    function removeAndResetMarkers() {
      for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(null);
      }
      markers = [];
    }

    function getMarkerData(bounds){
      $.ajax({
        type: 'POST',
        url: '/waters/within_bounding_box',
        data: JSON.stringify({
          'bounds': bounds,
          'max_number_of_waters': null
        }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: addMarkers,
        failure: function(errMsg) {
            alert(errMsg);
        }
      });
    }

  }

  if(document.getElementById('map') == null)
    return;

  initialize();
});

