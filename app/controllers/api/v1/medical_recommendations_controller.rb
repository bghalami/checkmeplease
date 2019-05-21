class Api::V1::MedicalRecommendationsController < ApplicationController

  def show
    render json: MedicalRecommendation.show_me(medical_recommendation)
  end

  def update
    medical_recommendation.update!(medical_recommendation_params)
    render json: medical_recommendation
  end

  def create
    render json: MedicalRecommendation.create_me(medical_recommendation, user_id, medical_recommendation_params)
  end

  def destroy
    render json: MedicalRecommendation.delete_me(medical_recommendation, user_id)
  end

  private

  def user_id
    params.permit(:user_id)[:user_id]
  end

  def medical_recommendation
    MedicalRecommendation.find_by(user_id: user_id)
  end

  def medical_recommendation_params
    params.require(:medical_recommendation).permit(:recommendation_number, :issuer, :state, :expiration_date, :path_to_image)
  end
end
