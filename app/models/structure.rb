class Structure < ApplicationRecord
  # {
  #   "x": decimal,
  #   "y": decimal,
  #   "z": decimal,
  # }
  serialize :center_point

  belongs_to :image_3d

  has_one_attached :contours
  has_one_attached :mesh
end
