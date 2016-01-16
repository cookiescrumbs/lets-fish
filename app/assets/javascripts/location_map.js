$(document).ready(function() {
  var map,
  mapElement,
  lat,
  lng,
  marker,
  mapOptions = {
    draggable: false,
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
  //make a new instance of google maps
  mapElement = document.getElementById('map');
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
