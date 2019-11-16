class PatientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :status, :treatment_plans

  def status
    object.current_treatment_plan.status
  end

  def treatment_plans
    object.treatment_plans.pluck(:id, :name, :status).map do |plan|
      {
        id: plan.first,
        name: plan.second,
        status: plan.last,
      }
    end
  end
end
