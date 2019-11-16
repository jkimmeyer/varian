class Patient < ApplicationRecord
  has_many :treatment_plans

  def current_treatment_plan
    treatment_plans.last
  end
end
