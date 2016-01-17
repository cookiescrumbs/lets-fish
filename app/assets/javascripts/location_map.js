$(document).ready(function() {
  var map,
  mapElement,
  lat,
  lng,
  marker,
  mapOptions = {
    draggable: true,
    scrollwheel: false,
    streetViewControl: true,
    mapTypeControlOptions: {
      mapTypeIds: [
        google.maps.MapTypeId.SATELLITE,
        google.maps.MapTypeId.ROADMAP
      ]
    }
  };

    // $('#location').click(function () {
    //   $('#location-map').css("pointer-events", "auto");
    // });

  if ("ontouchend" in document) {
    mapOptions.streetViewControl = false;
    mapOptions.mapTypeControl = false;
    mapOptions.zoomControl = false;
    mapOptions.draggable = false;
  }
  ////////Map
  //make a new instance of google maps
  mapElement = document.getElementById('location-map');
  lat = parseFloat(mapElement.dataset.lat);
  lng = parseFloat(mapElement.dataset.lng);
  map = new google.maps.Map(mapElement, mapOptions);
  map.setCenter({lat: lat , lng: lng});
  map.setZoom(10);
  //////////////////////////////////////////////////////

  //wait till map has loaded and add a  marker
  google.maps.event.addListenerOnce(map,'idle', function(){
      new google.maps.Marker({
        position: new google.maps.LatLng(lat,lng),
        map: map
      });
  });

});
