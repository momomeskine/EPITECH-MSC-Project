import axios from 'axios'

const DEFAULT_URL = 'http://localhost:4000/api'

class ApiServer {
  constructor() {
    this.url = DEFAULT_URL
    this.instance = axios.create({
      baseURL: this.url,
      withCredentials: true,
    })
  }

  changeUrl(url = DEFAULT_URL) {
    this.url = url
    this.instance.defaults.baseURL = this.url
  }

  // -----
  //      [ Authentification ]
  // -----
  async logIn(email, password) {
    return this.instance.post('/login', { email, password })
  }

  async signUp(email, password) {
    return this.instance.post('/signup', { email, password })
  }

  // -----
  //      [ Users ]
  // -----
  getUsers() {
    return this.instance.get('/users')
  }

  getUserBySearch(email, username) {
    return this.instance.get(`/users?email=${email}&username=${username}`)
  }

  getUser(id) {
    return this.instance.get(`/users/${id}`)
  }

  createUser(email, username) {
    return this.instance.post(`/users`, { user: { email, username } })
  }

  updateUser(email, username) {
    return this.instance.put(`/users`, { user: { email, username } })
  }

  deleteUser(id) {
    return this.instance.delete(`/users/${id}`)
  }

  // -----
  //      [ Tools ]
  // -----
  /**
   * @param  {any} err
   * @returns {string}
   */
  static errorToString(err) {
    if (err.response?.data?.message === 'email must be an email') {
      return 'Must be an valid email'
    } else if (err.response?.data?.message === "You're password not matching") {
      return err.response.data.message
    } else if (/You're email .+? not found/.test(err.response?.data?.message)) {
      return err.response.data.message
    } else if (/You're email .+? already exists/.test(err.response?.data?.message)) {
      return err.response.data.message
    } else {
      console.error(err, err.message, err.response)
      const str = err.response?.data?.message || err.message || JSON.stringify(err)
      return str
    }
  }
}

const apiServer = new ApiServer()

export { ApiServer, apiServer }
