class MedicalRecommendation < ApplicationRecord
  validates_presence_of :recommendation_number,
                        :issuer,
                        :state,
                        :expiration_date,
                        :path_to_image
  belongs_to :user

  def self.delete_me(medical_recommendation, user_id)
    if medical_recommendation.destroy
      "{\"message\": \"Medical Recommendation for User #{user_id} successfully deleted\"}"
    else
      "{\"message\": \"Something went wrong, please try again.\"}"
    end
  end

  def self.create_me(medical_recommendation, user_id, medical_recommendation_params)
    user = User.find_by_id(user_id)
    if medical_recommendation == nil
      user.medical_recommendation = MedicalRecommendation.create(medical_recommendation_params)
      if user.medical_recommendation.save
        user.medical_recommendation
      else
        "{\"message\": \"Something went wrong, please try again.\"}"
      end
    else
      "{\"message\": \"User #{user_id} already has a Medical Recommendation\"}"
    end
  end

  def self.update_me(medical_recommendation, medical_recommendation_params)
    medical_recommendation.update!(medical_recommendation_params)
    medical_recommendation
  end
end
