class MedicalRecommendationSerializer < ActiveModel::Serializer
  attributes :recommendation_number, :issuer, :state, :expiration_date, :path_to_image
end
