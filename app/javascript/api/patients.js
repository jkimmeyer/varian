import axios from 'axios'
import { PatientInstance } from '../instances'

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

export function getPatients() {
  let patients = [];
  let errors = [];
  axios.get('http://localhost:3000/api/patients/')
  .then(response => {
    // JSON responses are automatically parsed.
    patients = response;
  })
  .catch(e => {
    errors = e;
  })
  console.log(patients)
  return {patients: patients, errors: errors};
}

export function getCurrentTreatmentPlan(patientId) {
  axios.get('http://localhost:3000/api/patients/' + patientId + '/treatment_plans/current')
  .then(response => {
    // JSON responses are automatically parsed.
    return response;
  })
  .catch(e => {
    return e;
  })
}

export function getPatient(patientId) {
  axios.get('http://localhost:3000/api/patients/' + patientId)
  .then(response => {
    // JSON responses are automatically parsed.
    return response;
  })
  .catch(e => {
    return e;
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
