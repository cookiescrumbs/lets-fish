import { Controller } from "https://unpkg.com/@hotwired/stimulus/dist/stimulus.js"

export default class extends Controller {

  static targets = ['postcode', 'destination', 'message']
  
  setDestination() {
    this._destination = this.destination
  }

  message() {
    if(this.postcode && this._destination) {
      // some fetch code here to get the distance message
      this.messageTarget.innerHTML = `<mark>${this.postcode} is 378 miles from ${this.destination}</mark>`
    }
  }

  get postcode() {
    return this.postcodeTarget.value
  }

  get destination() {
    let destination = false
    this.destinationTargets.forEach((el) => {
      if(el.checked){
        destination = el.getAttribute('value')
      }
    })
    return destination;
  }

}
