import { Controller } from "https://unpkg.com/@hotwired/stimulus/dist/stimulus.js"


const getDistancMessage = async (start, finish) => {
  const response = await fetch(`/destination/start/${start}/finish/${finish}`);
  return response.text();
}


export default class extends Controller {

  static targets = ['postcode', 'destination', 'message'];

  connect() {
    this.setDestination();
  }
  
  setDestination() {
    this._destination = this.destination;
  }

  message() {
    if(this.postcode && this.destination) {
      const start = this.postcode;
      const finish = this.destination;
      getDistancMessage(start, finish)
      .then((message) => {
        this.messageTarget.innerHTML = message;
      });
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
