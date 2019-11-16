class Api::TreatmentPlansController < ApplicationController
  before_action :find_patient

  def index
    @plans = @patient.treatment_plans

    render json: @plans
  end

  def show
    @plan = @patient.treatment_plans.find(params[:id])
    render json: @plan
  end

  def current
    redirect_to action: :show, patient_id: @patient.id, id: @patient.treatment_plans.last.id
  end

  def update_status
    @plan = @patient.treatment_plans.find(params[:id])
    update_possible =
      case params[:status]
      when 'created'
        @plan.resettable?
      when 'rejected'
        @plan.rejectable?
      when 'approved'
        @plan.approvable?
      else
        false
      end

    if update_possible
      @plan.update(status: params[:status])
      render json: @plan
    else
      render json: { errors: ['only the statuses "created", "rejected", and "approved" are allowed! Also, the cycle is "created"->"rejected|approved"->"created".'] }, root: false, status: :unprocessable_entity
    end
  end

  private

  def find_patient
    @patient = Patient.find(params[:patient_id])
  end
end
