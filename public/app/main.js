// Import and register all your controllers from the importmap under controllers/*

import { application } from './controllers/application.js';

import NearByDistanceController from './controllers/nearby/distance_controller.js';
import NearByFormController from './controllers/nearby/form_controller.js';
import CurrentLocationController from './controllers/current_location_controller.js';

application.register('nearby-distance', NearByDistanceController);
application.register('nearby-form', NearByFormController);
application.register('current-location', CurrentLocationController);
