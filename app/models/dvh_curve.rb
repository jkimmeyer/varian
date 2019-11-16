class DvhCurve < ApplicationRecord
  # [
  #   {
  #     "dose": decimal,
  #     "volume": decimal
  #   },
  #   ...
  # ]
  serialize :curve_points

  belongs_to :treatment_plan
end
