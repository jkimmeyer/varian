class IsodoseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :level, :volume, :contours, :mesh

  def contours
    return unless object.contours.attached?

    rails_blob_path(object.contours, only_path: true)
  end

  def mesh
    return unless object.mesh.attached?

    rails_blob_path(object.mesh, only_path: true)
  end
end
