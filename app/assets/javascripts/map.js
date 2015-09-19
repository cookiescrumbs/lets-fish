$(document).ready(function() {
  var mapOptions = {
    mapTypeControlOptions: {
      style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
      mapTypeIds: [
        google.maps.MapTypeId.SATELLITE,
        google.maps.MapTypeId.ROADMAP
      ]
    }
  },
  markers =[],
  boundingBox;

  //make the a new instance of google maps available on window, so we can access it anywhere
  //anywhere on the page.
  window.map = new google.maps.Map(document.getElementById('map'), mapOptions);
  ///////Search Box
  // Create the search box and link it to the UI element.
  var input = (document.getElementById('map-search-box'));
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
  window.searchBox = new google.maps.places.SearchBox((input));

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

  // function addMakersWithInBoundingBox(boundingBox){
  //   getMarkerData(boundingBox);
  // }

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
