import 'jquery';


import $ from 'jquery';

import 'popper.js';

import 'bootstrap';

import 'sortablejs';


import Sortable, { Swap } from 'sortablejs';

$(document).ready(function() {
  Sortable.create(simpleList, { /* options */ });
});
