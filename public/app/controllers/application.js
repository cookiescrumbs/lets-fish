import { Application } from "https://unpkg.com/@hotwired/stimulus/dist/stimulus.js"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
