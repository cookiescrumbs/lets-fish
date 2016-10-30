$(document).ready(function() {
  // If small screen don't load the map JS
  if($( window ).width() < 768) {
    return;
  }

  //Remove the server side result list it doesn't always tally with the pins on the map
  //but the server side list is used on mobile becuase this js doesn't load under 768px
  $('#results-container').empty();

  var map,
  geocoder = new google.maps.Geocoder(),
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
  boundingBox,
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
    boundingBox = getBoundingBoxFromMap(map);
    getMarkersAndResultsFromBounds(boundingBox);
  });
  /////////////////////////

  function buildMapRoundLocation(location) {
    if(!location) {
      return null;
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
        boundingBox = getBoundingBoxFromMap(map);
        getMarkersAndResultsFromBounds(boundingBox);
      } else {
        console.log('Geocode was not successful for the following reason: ' + status);
      }
    });
  }

  function buildMapRoundGeographicalCenter(lat,lng) {
        if(!lat && !lng) {
          return;
        }
        map.setCenter(new google.maps.LatLng(lat,lng));
        map.setZoom(zoom);
        boundingBox = getBoundingBoxFromMap(map);
        getMarkersAndResultsFromBounds(boundingBox);
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
        icon: "https://chart.googleapis.com/chart?chst=d_map_spin&chld=1|0|fed136|13|_|" + markerCount,
        map: map
      });
      marker.setMap(map);
      markers.push(marker);
    }
  }

  function searchResults(searchResults){
      var waters = searchResults.markers;
      var results = searchResults.results;
      addMarkers(waters);
      addResultsToPage(results);
  }

  function initialMarkers(searchResults){
    var waters = searchResults.markers;
    addMarkers(waters);
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
      url: '/search',
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
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.

;
