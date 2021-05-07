/*
 * Welcome to your app's main JavaScript file!
 *
 * We recommend including the built version of this JavaScript file
 * (and its CSS file) in your base layout (base.html.twig).
 */

// any CSS you import will output into a single css file (app.css in this case)
import './styles/app.css';

// start the Stimulus application
import './bootstrap';

// loads the jquery package from node_modules
import jQuery from 'jquery';

// require jQuery normally
const $ = require('jquery');

// create global $ and jQuery variables
global.$ = global.jQuery = $;

// import the function from greet.js (the .js extension is optional)
// ./ (or ../) means to look for a local file
import navHandler from './navHandler';



$(document).ready(function() {
  $('nav > ol').append('<li>'+navHandler()+'</li>');
});
