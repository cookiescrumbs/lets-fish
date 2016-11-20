// HelloWorldWidget is an arbitrary name for any "dumb" component. We do not recommend suffixing
// all your dumb component names with Widget.

import React from 'react';

// Simple example of a React "dumb" component
export default class HelloWorldWidget extends React.Component {

    mapOptions(){
      return {
        draggable: true,
        scrollwheel: false,
        streetViewControl: true,
        mapTypeControlOptions: {
          mapTypeIds: [
            google.maps.MapTypeId.SATELLITE,
            google.maps.MapTypeId.ROADMAP
          ]
        },
        mapTypeId: google.maps.MapTypeId.SATELLITE
      };
    }

  componentDidMount() {
    
    const mapElement = document.getElementById('location-map');
    const map = new google.maps.Map(mapElement, this.mapOptions());
    
    map.setCenter({lat: 52.9999956 , lng: -3.9429671});
    map.setZoom(9);

    google.maps.event.addListenerOnce(map,'idle', function(){
      new google.maps.Marker({
        position: new google.maps.LatLng(52.9999956, -3.9429671),
        map: map
      });
    });

  }

  render() {
    return (
      <div>
        <div id="location-map"></div>
      </div>
    );
  }
}
