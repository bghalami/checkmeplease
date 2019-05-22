class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :valid_user, only: [:show, :update, :destroy]
  require 'pry'
  private

  def valid_user
    if params[:id]
      render json: "{\"message\":\"No User found with ID #{params[:id]}\"}" if !user
    else
      render json: "{\"message\":\"No User found with ID #{params[:user_id]}\"}" if !user
    end
  end

  def user
    if params[:id]
      User.find_by_id(params[:id])
    else
      User.find_by_id(params[:user_id])
    end
  end
end
