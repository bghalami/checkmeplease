class Api::V1::MedicalRecommendationsController < ApplicationController

  def show
    if medical_recommendation
      render json: medical_recommendation
    else
      render json: "{\"message\": \"User #{user_id} has no Medical Recommendation\"}"
    end
  end

  def update
    medical_recommendation.update!(medical_recommendation_params)
    render json: medical_recommendation
  end

  def create
    user = User.find_by_id(user_id)
    if medical_recommendation == nil
      user.medical_recommendation = MedicalRecommendation.create(medical_recommendation_params)
      if user.medical_recommendation.save
        render json: user.medical_recommendation
      end
    else
      render json: "User #{user_id} already has a Medical Recommendation"
    end
  rescue
      render json: error
  end

  def destroy
    if medical_recommendation.destroy
      render json: "{\"message\": \"Medical Recommendation for User #{user_id} successfully deleted\"}"
    else
      render json: error_message
    end
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
