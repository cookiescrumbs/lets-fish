import { Controller } from 'https://unpkg.com/@hotwired/stimulus/dist/stimulus.js';

export default class extends Controller {
  
  submit() {
    this.element.innerHTML = "Loading....";
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(this.currentPosition);
    }
  }

  currentPosition(position) {
    window.location.href = `/waters/nearby/location/${position.coords.latitude},${position.coords.longitude}/within/200`;
  }
}
