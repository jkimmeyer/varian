class DvhCurveSerializer < ActiveModel::Serializer
  attributes :id, :name, :min_dose, :max_dose, :mean_dose, :curve_points
end
