import Vue from 'vue'
import { library } from '@fortawesome/fontawesome-svg-core'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
import { fas } from '@fortawesome/free-solid-svg-icons'
import { far } from '@fortawesome/free-regular-svg-icons'
import { fab } from '@fortawesome/free-brands-svg-icons'

// Fontawesome
Vue.component('font-awesome-icon', FontAwesomeIcon)

library.add(fas)
library.add(far)
library.add(fab)

// NODE_ENV - this will be one of "development", "production" or "test" depending on the mode the app is running in.
if (process.env.NODE_ENV === 'development') {
  1
}
