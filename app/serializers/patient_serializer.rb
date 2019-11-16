class PatientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :status

  def status
    object.current_treatment_plan.status
  end
end
