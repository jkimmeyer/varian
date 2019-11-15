class Api::PatientsController < ApplicationController
  def index
    render json: Patient.all, each_serializer: PatientSerializer
  end

  def show
    render json: Patient.find(params[:id]), serializer: PatientSerializer
  end
end
