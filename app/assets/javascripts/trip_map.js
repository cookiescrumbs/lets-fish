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
    draggable: true
  });

  bindDataLayerListeners(map.data);

  function addTimelineEventTemplateToTheView(event){
    var template = $('#event-temp').html(),
    html = Mustache.render(template, event.properties),
    eventId = event.styles.id,
    countClass = event.styles.count,
    timeline = event.styles.timeline,
    eventNum = (event.id + 1),
    countElement = '<div class="timeline-image '+ countClass +'"><h1>'+ eventNum +'</h1></div>',
    listItem = '<li id="'+ eventId +'" class="'+ timeline +'">'+ countElement + html +'</li>';

    $(listItem).appendTo("ul.timeline");
  }

  function getLocalStorageItem(item) {
    return JSON.parse(localStorage.getItem(item));
  }

  function buildTimelineEventFromFeature(feature){
      dateTime = feature.getProperty('dateTime'),
      subheading = feature.getProperty('subheading'),
      description = feature.getProperty('description');
      return {
        dateTime: (typeof dateTime === 'undefined' || !dateTime)? 'Click here to add a date/time': dateTime,
        subheading: (typeof subheading === 'undefined' || !subheading)? 'Click here to add a subheading': subheading,
        description:  (typeof description === 'undefined' || !description)? 'Click here to add a description': description
      };
  }

  function buildTimelineEvent(num){
    return {
      id: num,
      properties: {},
      styles: {
          id:'event-'+num,
          count: (num % 2)? 'event-count' : 'event-count-inverted',
          timeline: (num % 2)? '' : 'timeline-inverted'
      }
    };
  }

  function bindDataLayerListeners(dataLayer) {

    dataLayer.addListener('addfeature',function(mapData){
      var feature = mapData.feature,
      type = feature.getGeometry().getType(),
      id = markerCount,
      timelineEvent = {};

      if (type == 'Point') {
        markerCount++;
        map.data.overrideStyle(
          feature,
          {
            icon: "https://chart.googleapis.com/chart?chst=d_map_spin&chld=1|0|fed136|13|_|" + markerCount
          }
        );

        // feature.setProperty('dateTime', '10:00am');
        // feature.setProperty('subheading', 'this is a subheading');
        // feature.setProperty('description', 'this is a description');

        // console.log(feature);
        // console.log(feature.getId());
        // console.log(feature.getProperty('dateTime'));
        // console.log(feature.getProperty('subheading'));
        // console.log(feature.getProperty('description'));

        timelineEvent = buildTimelineEvent(id);
        timelineEvent.properties = buildTimelineEventFromFeature(feature);
        //add timeline event to the view
        addTimelineEventTemplateToTheView(timelineEvent);
      }
      saveDataLayer();
    });

    dataLayer.addListener('removefeature', saveDataLayer);
    dataLayer.addListener('setgeometry', saveDataLayer);
  }

  function saveDataLayer() {
    map.data.toGeoJson(function (json) {
      json.features.forEach(function(feature, index){
        feature.id = index;
      });
      localStorage.setItem('geoData', JSON.stringify(json));
    });
  }

  function loadDataLayer(map) {
    var data = JSON.parse(localStorage.getItem('geoData'));
    map.data.forEach(function (f) {
        map.data.remove(f);
    });
    map.data.addGeoJson(data);
  }

  loadDataLayer(map);
});


