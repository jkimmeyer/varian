class Patient < ApplicationRecord
  has_many :treatment_plans
end
