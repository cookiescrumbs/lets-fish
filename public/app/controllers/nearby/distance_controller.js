import { Controller } from 'https://unpkg.com/@hotwired/stimulus/dist/stimulus.js';

const getDistancMessage = async (start, finish) => {
  const response = await fetch(`/destination/start/${start}/finish/${encodeURIComponent(finish)}`);
  return response.text();
}

export default class extends Controller {

  static targets = ['address', 'message'];

  connect() {
    if (this.start) {
      this.setDistanceMessage();
    }
  }

  get finish() {
    return this.addressTarget.dataset.latlng;
  }
  
  get start() {
    return this.addressTarget.dataset.location || false;
  }

  async setDistanceMessage() {
    const message = await getDistancMessage(this.start, this.finish);
    this.messageTarget.innerHTML = message;
  }

}
