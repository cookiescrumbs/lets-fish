$(document).ready(function() {
  var map,
  mapElement,
  lat,
  lng,
  event = {},
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

  function addEventTemplateToTheView(event){
    var html = $('#event-temp').html(),
    eventId = event.styles.id,
    countClass = event.styles.count,
    timeline = event.styles.timeline,
    eventNum = event.num,
    countElement = '<div class="timeline-image '+ countClass +'"><h1>'+ event.num +'</h1></div>',
    listItem = '<li id="'+ eventId +'" class="'+ timeline +'">'+ countElement + html +'</li>';

    $(listItem).appendTo("ul.timeline");
  }

  function bindDataToTheView(event){
    var eventId = event.styles.id,
    data = event.data;

    new Vue({
      el: '#'+ eventId,
      data: data,
      methods: {
        save: function(){
        }
      }
    });

  }

  function eventDataFromLocalStorage(num){
      var geoData = JSON.parse(localStorage.getItem('geoData'));
      num = (num-1),
      dateTime = geoData.features[num].properties.dateTime,
      subheading = geoData.features[num].properties.subheading,
      description = geoData.features[num].properties.description;

      return {
        dateTime: dateTime,
        subheading: subheading,
        description: description
      };
  }

  function buildEventObject(num){
    return {
      num: num,
      data: eventDataFromLocalStorage(num),
      styles: {
          id:'event-'+num,
          count: (num % 2)? 'event-count' : 'event-count-inverted',
          timeline: (num % 2)? '' : 'timeline-inverted'
      }
    };
  }

  function bindDataLayerListeners(dataLayer) {

    dataLayer.addListener('addfeature',function(event){
      var type = event.feature.getGeometry().getType();
      if (type == 'Point') {
        markerCount++;
        event.feature.setProperty('markerCount', markerCount);
        event.feature.setProperty('dateTime', 'Add date / time here stupid');
        event.feature.setProperty('subheading', 'Add subheading here stupid');
        event.feature.setProperty('description', 'Add description here stupid');
        saveDataLayer();
        map.data.overrideStyle(
          event.feature,
          {
            icon: "https://chart.googleapis.com/chart?chst=d_map_spin&chld=1|0|fed136|13|_|" + markerCount
          }
        );

        event = {};
        event = buildEventObject(markerCount);
        addEventTemplateToTheView(event);
        bindDataToTheView(event);
      }
      saveDataLayer();
    });

    dataLayer.addListener('removefeature', saveDataLayer);
    dataLayer.addListener('setgeometry', saveDataLayer);
  }

  loadDataLayer(map);
});
