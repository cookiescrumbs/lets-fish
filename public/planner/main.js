// Import and register all your controllers from the importmap under controllers/*

import { application } from "./controllers/application.js"

import HelloController from "./controllers/hello_controller.js"
application.register("hello", HelloController);
