class Api::V1::UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    render json: user
  end

  def update
    render json: User.update_me(user, user_params)
  end

  def create
    render json: User.create_me(user_params)
  end

  def destroy
    render json: User.destroy_me(user, params)
  end

  private
  def user
    User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email_address, :date_of_birth)
  end
end
