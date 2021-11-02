import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    meta: { layout: 'WithSideBar' },
    component: require('@/views/Home.vue').default,
  },
  {
    path: '/about',
    name: 'About',
    meta: { layout: 'WithSideBar', needAuth: true },
    component: () => import(/* webpackChunkName: "about" */ '@/views/About.vue'),
  },
  {
    path: '/login',
    name: 'SignIn',
    component: () => import(/* webpackChunkName: "auth" */ '@/views/SignIn.vue'),
  },
  {
    path: '/register',
    name: 'SignUp',
    component: () => import(/* webpackChunkName: "auth" */ '@/views/SignUp.vue'),
  },
  {
    path: '/testapi',
    name: 'TestAPI',
    meta: { layout: 'WithSideBar' },
    component: () => import(/* webpackChunkName: "testapi" */ '@/views/TestAPI.vue'),
  },
  {
    path: '/:catchAll(.*)',
    name: 'NotFound',
    component: require('@/views/NotFound.vue').default,
  },
]

const router = new VueRouter({
  mode: 'hash',
  base: process.env.BASE_URL,
  routes,
})

router.beforeEach((to, from, next) => {
  /*
  if (to.matched.some(m => m.meta.needAuth)) {
      const hasAuthCookie = /Authorization=(.+?)(;|$)/.test(decodeURIComponent(document.cookie))

      if (!hasAuthCookie) {
          next({ name: 'SignIn' })
          return
      }
  }
  */
  next()
})

export default router
