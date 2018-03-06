$(document).ready(function() {
  // If small screen don't load the map JS
  //hide map form mobile before returning
  // if($( window ).width() < 768) {
  //   $('#map').hide();
  //   return;
  // }

  var geocoder = new google.maps.Geocoder(),
  mapOptions = {
    scrollwheel: false,
    streetViewControl: false,
    mapTypeControlOptions: {
      style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
      position: google.maps.ControlPosition.LEFT_BOTTOM,
      mapTypeIds: [
        google.maps.MapTypeId.HYBRID,
        google.maps.MapTypeId.SATELLITE,
        google.maps.MapTypeId.ROADMAP
      ]
    },
    mapTypeId: google.maps.MapTypeId.HYBRID
  },
  markers =[],
  mapElement = document.getElementById('map'),
  zoom = getZoom(),
  location = getLocation();

  //make the a new instance of google maps
  map = new google.maps.Map(mapElement, mapOptions);

  buildMapRoundLocation(location);

  function getLocation() {
    var location;
    if(!urlParam('location')) {
      return null;
    }
    location = urlParam('location');
    return decodeURIComponent(location);
  }

  function getZoom() {
    return parseInt(mapElement.dataset.zoom) || 9;
  }

  /////Adding markers when the user zooms the map
  google.maps.event.addListener(map, 'zoom_changed', function() {
    // add markers to map within bounding box
    boundingBox = getBoundingBoxFromMap(map);
    getMarkersAndResultsFromBounds(boundingBox);
  });
  ////////////////////////

  ///////Adding markers when the user drags the map
  google.maps.event.addListener(map, 'dragend', function() {
    var boundingBox = getBoundingBoxFromMap(map);
    var center = getCenterFromMap(map);
    getMarkersAndResultsFromBounds(boundingBox);
  });
  /////////////////////////

  function buildMapRoundLocation(location) {

    if(!location) {
      return;
    }

    geocoder.geocode({'address': location}, function(results, status) {
      if (status === google.maps.GeocoderStatus.OK) {
        window.results = results;
        var resultBounds = new google.maps.LatLngBounds(
          results[0].geometry.viewport.getSouthWest(),
          results[0].geometry.viewport.getNorthEast()
        );
        map.fitBounds(resultBounds);
        map.setZoom(zoom);
        var boundingBox = getBoundingBoxFromMap(map);
        var center = getCenterFromMap(map);
        getMarkersAndResultsFromBounds(boundingBox);
      } else {
        console.log('Geocode was not successful for the following reason: ' + status);
      }
    });
  }

  function getBoundingBoxFromMap(map) {
    var bounds = map.getBounds();
    var northEast  = bounds.getNorthEast();
    var southWest  = bounds.getSouthWest();
    return [southWest.lat(), southWest.lng(), northEast.lat(), northEast.lng()];
  }

  function getCenterFromMap(map){
    if(!map) {
      return;
    }
    return [map.center.lat(), map.center.lng()];
  }

  function addMarkers(data){
    removeAndResetMarkers();
    for (i = 0; i < data.length; i++) {
      var markerCount = i;
      markerCount++;
      var latLng = new google.maps.LatLng(data[i]['lat'],data[i]['lng']);
      var marker = new google.maps.Marker({
        position: latLng,
        icon: data[i].icon + markerCount,
        map: map
      });
      marker.setMap(map);
      markers.push(marker);
    }
  }

  function searchResults(searchResults){
      var  markers = searchResults.markers;
      var results = searchResults.results;
      addMarkers(markers);
      addResultsToPage(results);
  }

  function initialMarkers(searchResults){
    var markers = searchResults.markers;
    addMarkers(markers);
  }

  function addResultsToPage(results){
    var hidden = $('#results-container').is(':hidden');

    $('#results-container').html(results);

    if(hidden) {
      $('#results-container').hide();
    }
  }

  function removeAndResetMarkers() {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
    markers = [];
  }

  function getMarkersAndResultsFromBounds(bounds){
    $.ajax({
      type: 'GET',
      url: '/search/within-bounding-box',
      data:{
        'bounds': bounds
      },
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function(data) {
        searchResults(data);
      },
      failure: function(errMsg) {
          alert(errMsg);
      }
    });
  }

  function urlParam(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results==null){
       return null;
    }
    else{
       return results[1] || 0;
    }
  }

});
