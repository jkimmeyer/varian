class Isodose < ApplicationRecord
  belongs_to :treatment_plan

  has_one_attached :contours
  has_one_attached :mesh
end
