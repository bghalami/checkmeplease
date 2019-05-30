class StateIdSerializer < ActiveModel::Serializer
  attributes :id_number, :state, :expiration_date, :path_to_image

  def expiration_date
    if object.expiration_date < DateTime.now.to_date
      "#{object.expiration_date}(EXPIRED)"
    else
      object.expiration_date
    end
  end
end
