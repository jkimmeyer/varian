class ThreeImageSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :grid_size
  attribute :image_voxels

  has_many :structures

  private

  def image_voxels
    rails_blob_path(object.image_voxels, disposition: 'attachment')
  end
end
