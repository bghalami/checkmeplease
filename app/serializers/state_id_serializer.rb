class StateIdSerializer < ActiveModel::Serializer
  attributes :id_number, :state, :expiration_date, :path_to_image
end
