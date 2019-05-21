class Api::V1::StateIdsController < ApplicationController

  def show
    render json: StateId.find_by(user_id: user_params[:user_id])
  end

  private
  def user_params
    params.permit(:user_id)
  end
end
