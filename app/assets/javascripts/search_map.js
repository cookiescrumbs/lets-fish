$(document).ready(function() {
  var map,
  image,
  shape,
  mapOptions = {
    mapTypeControlOptions: {
      style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
      position: google.maps.ControlPosition.LEFT_BOTTOM,
      mapTypeIds: [
        google.maps.MapTypeId.SATELLITE,
        google.maps.MapTypeId.ROADMAP
      ]
    }
  },
  markers =[],
  boundingBox;

  var image = {
    url: "/images/pin.png",
    // This marker is 20 pixels wide by 32 pixels high.
    size: new google.maps.Size(20, 32),
    // The origin for this image is (0, 0).
    origin: new google.maps.Point(0, 0),
    // The anchor for this image is the base of the flagpole at (0, 32).
    anchor: new google.maps.Point(0, 32)
  };

  var shape = {
    coords: [1, 1, 1, 20, 18, 20, 18, 1],
    type: 'poly'
  };

  //make the a new instance of google maps
  map = new google.maps.Map(document.getElementById('map'), mapOptions);
  ///////Search Box
  // Create the search box and link it to the UI element.
  var input = (document.getElementById('map-search-box'));
  map.controls[
    google.maps.ControlPosition.TOP_LEFT
  ].push(input);
  searchBox = new google.maps.places.SearchBox((input));

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
    getMarkersAndResultsFromBounds(boundingBox);
  });
  ///////////////////////////

  ////////Adding markers when map first loads
  google.maps.event.addListenerOnce(map,'idle', function(){
    var latLng;
    if(getLatLngFromUrl()) {
      latLng = getLatLngFromUrl();
    }
    map.setCenter(
      new google.maps.LatLng(latLng[0],latLng[1])
    );
    map.setZoom(10);
    getMarkersFromLatLng(latLng[0],latLng[1]);
    //show search box
    if($( window ).width() > 768) {
      $('#map-search-box').show("slow");
    }
    /////Adding markers when the user zooms the map
    google.maps.event.addListener(map, 'zoom_changed', function() {
      //add markers to map within bounding box
      boundingBox = getBoundingBoxFromMap(map);
      getMarkersAndResultsFromBounds(boundingBox);
    });
    //////////////////////////
  });
  //////////////////////////

  ///////Adding markers when the user drags the map
  google.maps.event.addListener(map, 'dragend', function() {
    boundingBox = getBoundingBoxFromMap(map);
    getMarkersAndResultsFromBounds(boundingBox);
  });
  /////////////////////////

  function getLatLngFromUrl() {
    var lat = $.urlParam('lat'),
    lng = $.urlParam('lng');
    if(lat && lng) {
      return [lat, lng]
    }
    return false;
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
      markerCount = i;
      markerCount++;
      var latLng = new google.maps.LatLng(waters[i]['latitude'],waters[i]['longitude']);
      var marker = new google.maps.Marker({
        position: latLng,
        label: markerCount.toString(),
        map: map
      });
      marker.setMap(map);
      markers.push(marker);
    }
  }

  function searchResults(searchResults){
      var waters = searchResults.markers,
      results = searchResults.results;
      addMarkers(waters);
      addResultsToPage(results);
  }

  function initialMarkers(searchResults){
    var waters = searchResults.markers;
    addMarkers(waters);
  }

  function addResultsToPage(results){
    $('#results-container').replaceWith(results);
  }

  function removeAndResetMarkers() {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
    markers = [];
  }

  function getMarkersAndResultsFromBounds(bounds){
    $.ajax({
      type: 'POST',
      url: '/search',
      data: JSON.stringify({
        'bounds': bounds
      }),
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: searchResults,
      failure: function(errMsg) {
          alert(errMsg);
      }
    });
  }

  function getMarkersFromLatLng(lat,lng){
    $.ajax({
      type: 'POST',
      url: '/search',
      data: JSON.stringify({
        'lat': lat,
        'lng': lng
      }),
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: initialMarkers,
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
