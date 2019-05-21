class UserSerializer < ActiveModel::Serializer
  has_one :state_id, serializer: StateIdSerializer
  has_one :medical_recommendation, serializer: MedicalRecommendationSerializer

  attributes :id, :name, :email_address, :state_id, :medical_recommendation
end
