$(document).ready(function() {
  // If small screen don't load the map JS
  //hide map form mobile before returning
  // if($( window ).width() < 768) {
  //   $('#map').hide();
  //   return;
  // }

  //Remove the server side result list it doesn't always tally with the pins on the map
  //but the server side list is used on mobile becuase this js doesn't load under 768px
  $('#results-container').empty();

  var geocoder = new google.maps.Geocoder(),
  mapOptions = {
    scrollwheel: false,
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
  mapElement = document.getElementById('map'),
  zoom = getZoom(),
  location = getLocation(),
  lat = getLat(),
  lng = getLng();

  //make the a new instance of google maps
  map = new google.maps.Map(mapElement, mapOptions);

  ///////Search Box
  // Create the search box and link it to the UI element.
  // var input = (document.getElementById('map-search-box'));
  // map.controls[
  //   google.maps.ControlPosition.TOP_LEFT
  // ].push(input);
  // searchBox = new google.maps.places.SearchBox((input));

  // Listen for the event fired when the user selects an item from the
  // pick list. Retrieve the matching places for that item.
  // google.maps.event.addListener(searchBox, 'places_changed', function() {
  //   var places = searchBox.getPlaces();
  //   if (places.length <= 0) {
  //     return;
  //   }
  //   // get the first selected result if there are multiple matches
  //   var firstResult = places[0];
  //   var bounds = new google.maps.LatLngBounds();
  //   bounds.extend(firstResult.geometry.location);
  //   map.fitBounds(bounds);
  //   map.setZoom(10);
  //   boundingBox = getBoundingBoxFromMap(map);
  //   getMarkersAndResultsFromBounds(boundingBox);
  // });
  ///////////////////////////

  ////////Adding markers when map first loads
  google.maps.event.addListenerOnce(map,'idle', function(){
    buildMapRoundLocation(location);
    buildMapRoundGeographicalCenter(lat,lng);
    ////////////////////////////
  });

  function getLocation() {
    var location;
    if(!document.getElementById('map').dataset.location && !urlParam('location')) {
      return null;
    }
    location = urlParam('location') ||  mapElement.dataset.location;
    return decodeURIComponent(location);
  }

  function getLat() {
    return parseFloat(mapElement.dataset.lat) || null;
  }

  function getLng() {
    return parseFloat(mapElement.dataset.lng) || null;
  }

  function getZoom() {
    return parseInt(mapElement.dataset.zoom) || 9;
  }

  /////Adding markers when the user zooms the map
  // google.maps.event.addListener(map, 'zoom_changed', function() {
  //   // add markers to map within bounding box
  //   boundingBox = getBoundingBoxFromMap(map);
  //   getMarkersAndResultsFromBounds(boundingBox);
  // });
  ////////////////////////

  ///////Adding markers when the user drags the map
  google.maps.event.addListener(map, 'dragend', function() {
    var boundingBox = getBoundingBoxFromMap(map);
    var center = getCenterFromMap(map);
    getMarkersAndResultsFromBounds(boundingBox, center);
  });
  /////////////////////////

  function buildMapRoundGeographicalCenter(lat,lng) {
      if(!lat && !lng) {
        return;
      }
      map.setCenter(new google.maps.LatLng(lat,lng));
      map.setZoom(zoom);
      var boundingBox = getBoundingBoxFromMap(map);
      var center = getCenterFromMap(map);
      getMarkersAndResultsFromBounds(boundingBox, center );
  }

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
        getMarkersAndResultsFromBounds(boundingBox, center);
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

  function getMarkersAndResultsFromBounds(bounds, center){
    $.ajax({
      type: 'GET',
      url: '/search/within-bounding-box',
      data:{
        'bounds': bounds,
        'center': center
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
