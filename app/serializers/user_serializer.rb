class UserSerializer < ActiveModel::Serializer
  has_one :state_id, serializer: StateIdSerializer
  has_one :medical_recommendation, serializer: MedicalRecommendationSerializer

  attributes :id, :name, :email_address, :date_of_birth, :state_id, :medical_recommendation

  def date_of_birth
    object.date_of_birth.to_date
  end
end
