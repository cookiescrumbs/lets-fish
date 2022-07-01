import { Controller } from "https://unpkg.com/@hotwired/stimulus/dist/stimulus.js"

class HelloController extends Controller {
  static targets = [ "name" ]
  connect() {
    console.log("Hello, Stimulus!");
  }
  greet() {
      const element = this.nameTarget
      const name = element.value
      console.log(`Hello, ${name}!`)
  }
}

export default HelloController;
