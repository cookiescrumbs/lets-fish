$(document).ready(function () {
  var geocoder = new google.maps.Geocoder(),
    mapOptions = {
      scrollwheel: false,
      streetViewControl: false,
      mapTypeControlOptions: {
        style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
        position: google.maps.ControlPosition.LEFT_BOTTOM,
        mapTypeIds: [
          google.maps.MapTypeId.SATELLITE,
          google.maps.MapTypeId.ROADMAP
        ]
      }
    },
    markers = [],
    mapElement = document.getElementById('map'),
    zoom = getZoom(),
    lat = getLat(),
    lng = getLng();
  slug = getSlug();
  //make the a new instance of google maps
  map = new google.maps.Map(mapElement, mapOptions);

  ////////Adding markers when map first loads
  google.maps.event.addListenerOnce(map, 'idle', function () {
    buildMapRoundGeographicalCenter(lat, lng);
    ////////////////////////////
  });

  function getLat() {
    return parseFloat(mapElement.dataset.lat) || null;
  }

  function getLng() {
    return parseFloat(mapElement.dataset.lng) || null;
  }

  function getSlug() {
    return mapElement.dataset.slug || null;
  }

  function getZoom() {
    return parseInt(mapElement.dataset.zoom) || 9;
  }

  function buildMapRoundGeographicalCenter(lat, lng) {

    if (!lat && !lng) {
      return;
    }

    map.setCenter(new google.maps.LatLng(lat, lng));
    map.setZoom(zoom);
    var center = getCenterFromMap(map);
    getWatersAndResultsFromSlug(slug);
  }

  function getCenterFromMap(map) {
    if (!map) {
      return;
    }
    return [map.center.lat(), map.center.lng()];
  }

  function addMarkers(data) {
    removeAndResetMarkers();
    for (i = 0; i < data.length; i++) {
      var markerCount = i;
      markerCount++;
      var latLng = new google.maps.LatLng(data[i]['lat'], data[i]['lng']);
      var marker = new google.maps.Marker({
        position: latLng,
        icon: data[i].icon + markerCount,
        map: map
      });
      marker.setMap(map);
      markers.push(marker);
    }
  }

  function searchResults(searchResults) {
    var markers = searchResults.markers;
    var results = searchResults.results;
    addMarkers(markers);
    addResultsToPage(results);
  }

  function initialMarkers(searchResults) {
    var markers = searchResults.markers;
    addMarkers(markers);
  }

  function addResultsToPage(results) {
    var hidden = $('#results-container').is(':hidden');

    $('#results-container').html(results);

    if (hidden) {
      $('#results-container').hide();
    }
  }

  function removeAndResetMarkers() {
    for (var i = 0; i < markers.length; i++) {
      markers[i].setMap(null);
    }
    markers = [];
  }

  function getWatersAndResultsFromSlug(slug) {
    $.ajax({
      type: 'GET',
      url: '/search/waters',
      data: {
        'slug': slug
      },
      contentType: "application/json; charset=utf-8",
      dataType: "json",
      success: function (data) {
        searchResults(data);
      },
      failure: function (errMsg) {
        alert(errMsg);
      }
    });
  }

  function urlParam(name) {
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if (results == null) {
      return null;
    }
    else {
      return results[1] || 0;
    }
  }

});
