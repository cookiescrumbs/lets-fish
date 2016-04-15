$(document).ready(function() {
  var map,
  mapElement,
  lat,
  lng,
  markerCount = 0,
  mapOptions = {
    draggable: true,
    scrollwheel: false,
    streetViewControl: false,
    mapTypeControlOptions: {
      mapTypeIds: [
        google.maps.MapTypeId.SATELLITE,
        google.maps.MapTypeId.ROADMAP
      ]
    },
    mapTypeId: google.maps.MapTypeId.SATELLITE
  };

  mapElement = document.getElementById('location-map');
  lat = parseFloat(mapElement.dataset.lat);
  lng = parseFloat(mapElement.dataset.lng);
  map = new google.maps.Map(mapElement, mapOptions);
  map.setCenter({lat: lat , lng: lng});
  map.setZoom(12);

  map.data.setControlPosition(google.maps.ControlPosition.TOP_RIGHT);
  map.data.setControls(['LineString','Point']);
  map.data.setStyle({
    editable: true,
    draggable: true,
    icon: "https://chart.googleapis.com/chart?chst=d_map_spin&chld=1|0|fed136|13|_|1"
  });

  bindDataLayerListeners(map.data);

  function saveDataLayer() {
    map.data.toGeoJson(function (json) {
      localStorage.setItem('geoData', JSON.stringify(json));
    });
  }

  function loadDataLayer(map) {
    var data = JSON.parse(localStorage.getItem('geoData'));
    map.data.forEach(function (f) {
        map.data.remove(f);
    });
    map.data.addGeoJson(data)
  }

  function addEventToTimeLine(eventCount){
    var event = {
      dateTime: "Add a date/time",
      subheading: "Add an event heading here...",
      description: "Add a description of the event here...."
    },
    template = $('#event-temp').html(),
    html = Mustache.to_html(template, event),
    eventCountClass = (eventCount % 2)? 'event-count' : 'event-count-inverted',
    eventCountElement = '<div class="timeline-image '+eventCountClass+'"><h1>'+eventCount+'</h1></div>',
    listItem = (eventCount % 2)? '<li>'+eventCountElement+html+'</li>' : '<li class="timeline-inverted">'+eventCountElement+html+'</li>';
    $(listItem).appendTo("ul.timeline");
  }

  function bindDataLayerListeners(dataLayer) {
    dataLayer.addListener('addfeature',function(event){
      var type = event.feature.getGeometry().getType();
      if (type == 'Point') {
        markerCount++;
        event.feature.setProperty('markerCount', markerCount);
        map.data.overrideStyle(
          event.feature,
          {
            icon: "https://chart.googleapis.com/chart?chst=d_map_spin&chld=1|0|fed136|13|_|" + markerCount
          }
        );
        addEventToTimeLine(markerCount);
      }
      saveDataLayer();
    });

    dataLayer.addListener('removefeature', saveDataLayer);
    dataLayer.addListener('setgeometry', saveDataLayer);
  }

  loadDataLayer(map);
});
