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
    editable(event);
  }

  function editable(event){
    var eventId = event.styles.id,
    feature = event.feature;

    $('#'+eventId+' h4.date-time').editable("dblclick", function(e){
      feature.setProperty('dateTime', e.value);
    });

    $('#'+eventId+' h4.subheading').editable("dblclick", function(e){
      feature.setProperty('subheading', e.value);
    });

    $('#'+eventId+' p.description').editable(
      {
        type: 'textarea',
        action: 'dblclick'
      },
      function(e){
        feature.setProperty('description', e.value);
      }
    );


  }

  function getLocalStorageItem(item) {
    return JSON.parse(localStorage.getItem(item));
  }

  function buildTimelineEventFromFeature(feature){
      dateTime = feature.getProperty('dateTime'),
      subheading = feature.getProperty('subheading'),
      description = feature.getProperty('description');
      return {
        dateTime: (typeof dateTime === 'undefined' || !dateTime)? 'Double click here to add a date/time': dateTime,
        subheading: (typeof subheading === 'undefined' || !subheading)? 'Double click here to add a title': subheading,
        description:  (typeof description === 'undefined' || !description)? 'Double click here to add a description': description
      };
  }

  function buildTimelineEvent(num){
    return {
      id: num,
      properties: {},
      feature: {},
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

        timelineEvent = buildTimelineEvent(id);
        timelineEvent.properties = buildTimelineEventFromFeature(feature);
        timelineEvent.feature = feature;
        addTimelineEventTemplateToTheView(timelineEvent);
      }
      saveDataLayer();
    });

    dataLayer.addListener('setproperty', saveDataLayer);
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


