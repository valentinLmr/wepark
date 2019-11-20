import "bootstrap";
import "../plugins/flatpickr"
import { listenSteps } from "../plugins/add"
// app/javascript/packs/application.js
// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();

listenSteps();
