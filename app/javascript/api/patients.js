import axios from 'axios'


export async function getPatients() {
  return await axios.get('http://localhost:3000/api/patients/');
}

export async function getPatient(patientId) {
  return await axios.get('http://localhost:3000/api/patients/' + patientId)
}

export async function getCurrentTreatmentPlan(patientId) {
  return await axios.get('http://localhost:3000/api/patients/' + patientId + '/treatment_plans/current')
}

export async function getTreatmentPlans(patientId) {
  return await axios.get('http://localhost:3000/api/patients/' + patientId + '/treatment_plans/')
}

export async function updateStatus(status, patientId, treatmentPlanId) {
  let payload = {status: status};
  return await axios.post('http://localhost:3000/api/patients/' + patientId + '/treatment_plans/'+ treatmentPlanId + '/update_status', payload)
}

export function postReview(patientId, treatmentPlanId, reviewStepId, payload) {
  axios.post('http://localhost:3000/api/patients/' + patientId + '/treatment_plans/' + treatmentPlanId + '/review-step/' + reviewStepId,
              payload)
  .then(response => {
    // JSON responses are automatically parsed.
    console.log(response)
  })
  .catch(e => {
    console.log(e)
  })
}

export function getPatientTreatments(patientId) {
  axios.get('http://localhost:3000/api/patients/' + patientId + '/treatment_plans')
  .then(response => {
    // JSON responses are automatically parsed.
    return response;
  })
  .catch(e => {
    return e;
  })
}

export function getPatientTreatment(patientId, treatmentId) {
  axios.get('http://localhost:3000/api/patients/' + patientId + '/treatment_plans/' + treatmentId)
  .then(response => {
    // JSON responses are automatically parsed.
    return response;
  })
  .catch(e => {
    return e;
  })
}
