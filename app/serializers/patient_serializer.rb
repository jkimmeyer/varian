class PatientSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :middle_name, :last_name
end
