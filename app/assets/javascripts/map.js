$(document).ready(function() {
  var map;

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

    google.maps.event.addListener(map, 'dragend', function() {
      var center = map.getCenter();

      bounds = map.getBounds();
      northEast  = bounds.getNorthEast();
      southWest  = bounds.getSouthWest();

      var maxNumberOfWaters = null;

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
  }

  if(document.getElementById('map') == null)
    return;

  initialize();
});

