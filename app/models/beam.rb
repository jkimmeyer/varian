class Beam < ApplicationRecord
  # {
  #   "x": decimal,
  #   "y": decimal,
  #   "z": decimal,
  # }
  serialize :isocenter

  belongs_to :treatment_plan
end
