import axios from 'axios'

export function sendData(route, payload) {
  axios.post('http://localhost:3000/api/' + route, payload)
  .then(response => {
    // JSON responses are automatically parsed.
    console.log(response)
  })
  .catch(e => {
    console.log(e)
  })
}
