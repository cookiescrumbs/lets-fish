$(document).ready(function() {
  var map,
  mapElement,
  kmlUrl,
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

  if ("ontouchend" in document) {
    mapOptions.streetViewControl = false;
    mapOptions.mapTypeControl = false;
    mapOptions.zoomControl = false;
    mapOptions.draggable = false;
  }

  ////////Map
  //make a new instance of google maps
  mapElement = document.getElementById('location-map');
  var timestamp = Math.floor(Date.now() / 1000);

  kmlUrl = 'https://dl.dropboxusercontent.com/u/7645502/trips/snowdonia-123.kml?'+ timestamp;
  map = new google.maps.Map(mapElement, mapOptions);
  map.setZoom(10);

  new google.maps.KmlLayer({
    url: kmlUrl,
    map: map
  });
  //////////////////////////////////////////////////////

});
