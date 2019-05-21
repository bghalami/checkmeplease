class Api::V1::UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    render json: User.show_me(user)
  end

  def update
    user.update!(user_params)
    render json: user
  end

  def create
    render json: User.create_me(user_params)
  end

  def destroy
    render json: User.delete_me(user)
  end

  private
  def user
    User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email_address, :date_of_birth)
  end
end
