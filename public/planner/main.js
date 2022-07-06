// Import and register all your controllers from the importmap under controllers/*

import { application } from "./controllers/application.js"

import DistanceController from "./controllers/distance_controller.js"
application.register("distance", DistanceController);
