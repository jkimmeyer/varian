class StructureSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :volume, :center_point, :color, :is_target_structure, :three_image_id, :contours, :mesh

  def contours
    rails_blob_path(object.contours, only_path: true)
  end

  def mesh
    rails_blob_path(object.mesh, only_path: true)
  end
end
