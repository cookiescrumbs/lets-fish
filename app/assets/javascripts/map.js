$(document).ready(function() {
  var map,
  markers =[],
  boundingBox;


  function initialize() {
    var latitude  = 54.43869834845736;
    var longitude =  -2.2472353515624945;
    var zoom = (latitude == 54.43869834845736 ) ? 5 : 15;
    var latLng = new google.maps.LatLng(latitude,longitude);

    $.urlParam = function(name){
      var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
      if (results==null){
         return null;
      }
      else{
         return results[1] || 0;
      }
    }

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
      centerMapToLocation(map);
      zoomMapToLevel(map, 10);
      boundingBox = getBoundingBoxFromMap(map);
      addMakersWithInBoundingBox(boundingBox);
    });

    google.maps.event.addListener(map, 'dragend', function() {
      boundingBox = getBoundingBoxFromMap(map);
      addMakersWithInBoundingBox(boundingBox);
      console.log(markers);
    });

    function centerMapToLocation(map) {
      var latLng = getLatLngFromUrl();
      if (latLng) map.setCenter(latLng);
    }

    function getLatLngFromUrl() {
      var lat = $.urlParam('lat'),
      lng = $.urlParam('lng');
      if(lat && lng) {
        return new google.maps.LatLng(lat,lng);
      }
      return false;
    }

    function zoomMapToLevel(map, level) {
      map.setZoom(level);
    }

    function addMakersWithInBoundingBox(boundingBox){
      getMarkerData(boundingBox);
    }

    function getBoundingBoxFromMap(map) {
      var bounds = map.getBounds();
      var northEast  = bounds.getNorthEast();
      var southWest  = bounds.getSouthWest();
      return [southWest.lat(), southWest.lng(), northEast.lat(), northEast.lng()];
    }

    function addMarkers(waters){
      removeAndResetMarkers();
      for (i = 0; i < waters.length; i++) {
        var latLng = new google.maps.LatLng(waters[i]['latitude'],waters[i]['longitude']);
        var marker = new google.maps.Marker({ position: latLng, map: map});
        marker.setMap(map);
        markers.push(marker);
      }
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

