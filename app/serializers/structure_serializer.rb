class StructureSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :volume, :center_point, :color, :is_target_structure, :three_image_id
  attribute :contours, :mesh

  def contours
    rails_blob_path(object.contours, disposition: 'attachment')
  end

  def mesh
    rails_blob_path(object.mesh, disposition: 'attachment')
  end
end
