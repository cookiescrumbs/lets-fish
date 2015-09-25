$(document).ready(function() {
  var map,
  searchBox,
  mapOptions = {
    mapTypeControlOptions: {
      style: google.maps.MapTypeControlStyle.DROPDOWN_MENU,
      mapTypeIds: [
        google.maps.MapTypeId.SATELLITE,
        google.maps.MapTypeId.ROADMAP
      ]
    }
  };

  ////////Map
  //make the a new instance of google maps
  map = new google.maps.Map(document.getElementById('map'), mapOptions);
  map.setCenter(
    getLatLngFromEditWaterForm()
  );
  map.setZoom(10);
  //////////////////////////////////////////////////////

  ///////Search Box
  // Create the search box and link it to the UI element.
  var input = (document.getElementById('map-search-box'));
  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
  searchBox = new google.maps.places.SearchBox((input));
  ///////////////////////////////////////////////////////
  displayInitialLatLng();
  //wait till map has loaded and add a draggable marker
  google.maps.event.addListenerOnce(map,'idle', function(){

      var marker = new google.maps.Marker({
        position: getMarkerPosition(map),
        map: map,
        draggable: true
      });

      addAndOpenInfoWindow(
        map,
        marker,
        content = "Drag and drop this marker onto the water you'd like to add."
      );

      //Add listener to update lat / lng marker details on the form
      google.maps.event.addListener(marker, 'drag', function() {
        updateMarkerPosition(marker.getPosition());
      });

      google.maps.event.addListener(map, 'dragend', function() {
        var center = map.getCenter();
        marker.setPosition(center);
      });

      google.maps.event.addListener(map, 'zoom_changed', function() {
        var center = map.getCenter();
        marker.setPosition(center);
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
    document.getElementById('latitude').value = lat;
    document.getElementById('longitude').value = lng;
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
    $('#display-latitude').text(lat);
    $('#display-longitude').text(lng);
  }

});
