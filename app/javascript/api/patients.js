import axios from 'axios'

export function postReview(patientId, treatmentPlanId, reviewStepId, payload) {
  axios.post('http://localhost:3000/api/patients/' + patientId + '/treatments/' + treatmentPlanId + '/review-step/' + reviewStepId,
              payload)
  .then(response => {
    // JSON responses are automatically parsed.
    console.log(response)
  })
  .catch(e => {
    console.log(e)
  })
}

export function getPatients() {
  axios.get('http://localhost:3000/api/patients')
  .then(response => {
    // JSON responses are automatically parsed.
    return {response: response};
  })
  .catch(e => {
    return {error: error}
  })
}

export function getCurrentTreatmentPlan(patientId) {
  axios.get('http://localhost:3000/api/patients' + patientId + '/current_treatment_plan')
  .then(response => {
    // JSON responses are automatically parsed.
    return {response: response};
  })
  .catch(e => {
    return {error: error}
  })
}

export function getPatient(patientId) {
  axios.get('http://localhost:3000/api/patients' + patientId)
  .then(response => {
    // JSON responses are automatically parsed.
    return {response: response};
  })
  .catch(e => {
    return {error: error}
  })
}

export function getPatientTreatments(patientId) {
  axios.get('http://localhost:3000/api/patients' + patientId + 'treatments')
  .then(response => {
    // JSON responses are automatically parsed.
    return {response: response};
  })
  .catch(e => {
    return {error: error}
  })
}

export function getPatientTreatment(patientId, treatmentId) {
  axios.get('http://localhost:3000/api/patients' + patientId + 'treatments' + treatmentId)
  .then(response => {
    // JSON responses are automatically parsed.
    return {response: response};
  })
  .catch(e => {
    return {error: error}
  })
}
