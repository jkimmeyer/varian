class ThreeImage < ApplicationRecord
  # {
  #   "xSize": integer,
  #   "ySize": integer,
  #   "zSize": integer,
  #   "xRes": decimal,
  #   "yRes": decimal,
  #   "zRes": decimal,
  #   "origin": {
  #     "x": decimal,
  #     "y": decimal,
  #     "z": decimal
  #   }
  # }
  serialize :grid_size

  belongs_to :treatment_plan
  has_many :structures

  has_one_attached :image_voxels
end
