class MedicalRecommendationSerializer < ActiveModel::Serializer
  attributes :recommendation_number, :issuer, :state, :expiration_date, :path_to_image

  def expiration_date
    if object.expiration_date < DateTime.now.to_date
      "#{object.expiration_date}(EXPIRED)"
    else
      object.expiration_date
    end
  end
end
