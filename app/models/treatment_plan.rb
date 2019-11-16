class TreatmentPlan < ApplicationRecord
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

  belongs_to :patient

  has_one_attached :dose_voxels
  has_one_attached :dvh_graph
  has_many_attached :bitmaps

  has_one :three_image
  has_many :beams
  has_many :isodoses
  has_many :dvh_curves
end
