$(document).ready(function() {
  var map,
  markers =[],
  searchBox,
  searchInput,
  marker,
  mapOptions = {
    mapTypeControlOptions: {
      style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
      position: google.maps.ControlPosition.LEFT_BOTTOM,
      mapTypeIds: [
        google.maps.MapTypeId.SATELLITE,
        google.maps.MapTypeId.ROADMAP
      ]
    }
  };

  ////////Map
  //make the a new instance of google maps
  map = new google.maps.Map(document.getElementById('map'), mapOptions);
  map.setCenter(initialiseMap());
  map.setZoom(10);
  //////////////////////////////////////////////////////

  ///////Search Box
  // Create the search box and link it to the UI element.
  searchInput = (document.getElementById('map-search-box'));
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(searchInput);
  searchBox = new google.maps.places.SearchBox(searchInput);
  ///////////////////////////////////////////////////////
  displayInitialLatLng();
  //wait till map has loaded and add a draggable marker
  google.maps.event.addListenerOnce(map,'idle', function(){

      marker = new google.maps.Marker({
        position: getMarkerPosition(map),
        map: map,
        draggable: true
      });

      addAndOpenInfoWindow(
        map,
        marker,
        content = "Drag and drop this marker onto the water you'd like to add."
      );

      //add markers to map within bounding box
      boundingBox = getBoundingBoxFromMap(map);
      getMarkersAndResultsFromBounds(boundingBox);

      updateMarkerPosition(marker.getPosition());

      //Add listener to update lat / lng marker details on the form
      google.maps.event.addListener(marker, 'drag', function() {
        updateMarkerPosition(marker.getPosition());
      });

      google.maps.event.addListener(map, 'dragend', function() {
        var center = map.getCenter();
        marker.setPosition(center);
        updateMarkerPosition(marker.getPosition());
        boundingBox = getBoundingBoxFromMap(map);
        getMarkersAndResultsFromBounds(boundingBox);
      });

      google.maps.event.addListener(map, 'zoom_changed', function() {
        var center = map.getCenter();
        marker.setPosition(center);
        //add markers to map within bounding box
        boundingBox = getBoundingBoxFromMap(map);
        getMarkersAndResultsFromBounds(boundingBox);
      });

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
        //add markers to map within bounding box
        boundingBox = getBoundingBoxFromMap(map);
        getMarkersAndResultsFromBounds(boundingBox);
      });
  });

  function addAndOpenInfoWindow(map, marker, content){
    var infowindow = new google.maps.InfoWindow({
        content: content
    });
    infowindow.open(map, marker);
  }

  function updateMarkerPosition(latLng) {
    var lat = latLng.lat();
    var lng = latLng.lng();
    $('#latitude')[0].value = lat;
    $('#longitude')[0].value = lng;
    $('#display-latitude').text(lat);
    $('#display-longitude').text(lng);
  }

  function getMarkerPosition(map){
    var editFormLatLng = getLatLngFromEditWaterForm();
    return !editFormLatLng ? map.getCenter() : editFormLatLng
  }

  function getLatLngFromEditWaterForm(){
    var lat = $('input#latitude').attr('value');
    var lng = $('input#longitude').attr('value');
    if( lat && lng ) {
      return new google.maps.LatLng(lat,lng);
    }
    return false;
  }

  function displayInitialLatLng(){
    var lat = $('input#latitude').attr('value');
    var lng = $('input#longitude').attr('value');

    if(lat & lng){
      $('#display-latitude').text(lat);
      $('#display-longitude').text(lng);
    }
  }

  function initialiseMap(){
    return (getLatLngFromEditWaterForm())? getLatLngFromEditWaterForm() : {lat: 53.4807593, lng: -2.2426305000000184};
  }

  function getBoundingBoxFromMap(map) {
    var bounds = map.getBounds();
    var northEast  = bounds.getNorthEast();
    var southWest  = bounds.getSouthWest();
    return [southWest.lat(), southWest.lng(), northEast.lat(), northEast.lng()];
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

  function searchResults(searchResults){
    var waters = searchResults.markers;
    addMarkers(waters);
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

  function removeAndResetMarkers() {
    for (var i = 0; i < markers.length; i++) {
        markers[i].setMap(null);
    }
    markers = [];
  }

});
