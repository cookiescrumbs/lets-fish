$(document).ready(function() {
  var map,
  markers =[],
  boundingBox;

  map = new google.maps.Map(document.getElementById('map'));
  ///////Search Box
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
    map.setZoom(10);
    boundingBox = getBoundingBoxFromMap(map);
    addMakersWithInBoundingBox(boundingBox);
  });
  ///////////////////////////

  ///////Responsive map
  google.maps.event.addDomListener(window, "resize", function() {
    var center = map.getCenter();
    google.maps.event.trigger(map, "resize");
    map.setCenter(center);
  });
  ///////////////////////////

  ////////Adding markers when map first loads
  google.maps.event.addListenerOnce(map,'idle', function(){
    centerMapToLocation(map);
    map.setZoom(10);
    boundingBox = getBoundingBoxFromMap(map);
    addMakersWithInBoundingBox(boundingBox);
  });
  //////////////////////////

  ///////Adding markers when map is dragend
  google.maps.event.addListener(map, 'dragend', function() {
    boundingBox = getBoundingBoxFromMap(map);
    addMakersWithInBoundingBox(boundingBox);
  });
  /////////////////////////

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

  $.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null){
       return null;
    }
    else{
       return results[1] || 0;
    }
  }
});

