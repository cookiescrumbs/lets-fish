import { Controller } from 'https://unpkg.com/@hotwired/stimulus/dist/stimulus.js';

export default class extends Controller {
  static targets = [ 'output'];

  submit() {
    const el = this.element;
    el.innerHTML = 'Loading...';
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(this.currentPosition, this.error);
    } else { 
      alert("Geolocation is not supported by this browser please enter a postcode.");
    }
  }
  
  currentPosition(position) {
    window.location.href = `/waters/nearby/location/${position.coords.latitude},${position.coords.longitude}/within/200`;
  }

  error() {
    const el = document.getElementById('current-location-button');
    el.innerHTML = '<span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span> Unable to retrieve your location. <br> Please enter a postcode.'; 
    el.classList.add('alert');
    el.classList.add('alert-danger');
    el.classList.remove('btn-primary');
  }
}
