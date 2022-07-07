import { Controller } from 'https://unpkg.com/@hotwired/stimulus/dist/stimulus.js';

export default class extends Controller {

  static targets = ['postcode'];

  submit() {
    if (this.postcode) {
      window.location.href = `/waters/nearby/location/${this.postcode}/within/200`;
    }  else {
      this.postcodeTarget.nextElementSibling.innerHTML = 'Please enter a postcode';  
    }
  
  }

  get postcode() {
    return this.postcodeTarget.value || false;
  }

}
