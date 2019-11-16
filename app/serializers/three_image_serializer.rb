class ThreeImageSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :grid_size, :image_voxels

  has_many :structures

  def image_voxels
    rails_blob_path(object.image_voxels, only_path: true)
  end
end
