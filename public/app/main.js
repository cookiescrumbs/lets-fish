// Import and register all your controllers from the importmap under controllers/*

import { application } from './controllers/application.js';

import NearByDistanceController from './controllers/nearby/distance_controller.js';
application.register('nearby-distance', NearByDistanceController);
