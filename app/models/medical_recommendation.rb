class MedicalRecommendation < ApplicationRecord
  validates_presence_of :recommendation_number,
                        :issuer,
                        :state,
                        :expiration_date,
                        :path_to_image
  belongs_to :user
end
