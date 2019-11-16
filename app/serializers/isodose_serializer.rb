class IsodoseSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :level, :volume

  attribute :contours, :mesh

  private

  def contours
    rails_blob_path(object.contours, disposition: 'attachment')
  end

  def mesh
    rails_blob_path(object.mesh, disposition: 'attachment')
  end
end
