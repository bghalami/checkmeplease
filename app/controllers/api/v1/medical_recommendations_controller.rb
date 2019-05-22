class Api::V1::MedicalRecommendationsController < ApplicationController

  def show
    render json: medical_recommendation
  end

  def update
    medical_recommendation.update!(medical_recommendation_params)
    render json: medical_recommendation
  end

  def create
    if !medical_recommendation
      user.medical_recommendation = MedicalRecommendation.new(medical_recommendation_params)
      if user.medical_recommendation.save
        render json: medical_recommendation
      else
        render json: "{\"message\": \"Something went wrong, please try again.\"}"
      end
    else
      render json:"{\"message\": \"User #{user.id} already has a Medical Recommendation\"}"
    end
  end

  def destroy
    if medical_recommendation.destroy
      render json: "{\"message\": \"Medical Recommendation for User #{user.id} successfully deleted\"}"
    else
      render json: "{\"message\": \"Something went wrong, please try again.\"}"
    end
  end

  private

  def user_id
    User.find_by_id(params[:user_id])
  end

  def medical_recommendation
    user.medical_recommendation
  end

  def medical_recommendation_params
    params.require(:medical_recommendation).permit(:recommendation_number, :issuer, :state, :expiration_date, :path_to_image)
  end
end
