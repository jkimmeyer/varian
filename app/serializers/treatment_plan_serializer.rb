class TreatmentPlanSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :status, :number_of_fractions, :planned_dose_per_fraction, :grid_size, :bitmaps, :dose_voxels, :dvh_graph

  has_one :three_image
  has_many :beams
  has_many :isodoses
  has_many :dvh_curves

  def bitmaps
    object.bitmaps.map do |bitmap|
      rails_blob_path(bitmap, only_path: true)
    end
  end

  def dose_voxels
    rails_blob_path(object.dose_voxels, only_path: true)
  end

  def dvh_graph
    rails_blob_path(object.dvh_graph, only_path: true)
  end
end
