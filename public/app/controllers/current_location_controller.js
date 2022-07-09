import { Controller } from 'https://unpkg.com/@hotwired/stimulus/dist/stimulus.js';

export default class extends Controller {
  
  submit() {
    this.element.innerHTML = "Loading....";
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(this.currentPosition);
    } else { 
      alert("Geolocation is not supported by this browser please enter a location");
    }
  }

  currentPosition(position) {
    window.location.href = `/waters/nearby/location/${position.coords.latitude},${position.coords.longitude}/within/200`;
  }
}
