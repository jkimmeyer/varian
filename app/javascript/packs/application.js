// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require('jquery')
require("channels")

import '../css/application';

// Custom JavaScript
// require('../custom/sutff/main.js')

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
import Vue from 'vue'
import TurbolinksAdapter from 'vue-turbolinks';
import Buefy from 'buefy'

import * as instances from '../instances'

Vue.use(Buefy)
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load', () => {

    // Initialize available instances
    Object.keys(instances).forEach((instanceName) => {
      const instance = instances[instanceName]
      const elements = document.querySelectorAll(instance.el)

      elements.forEach((element) => {
        const props = JSON.parse(element.getAttribute('data-props'))

        new Vue({
          el: element,
          render: h => h(instance.component, { props })
        })
      })
  })
});
