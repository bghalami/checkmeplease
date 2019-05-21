class Api::V1::UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    render json: user
  end

  def update
    user.update!(user_params)
    render json: user
  end

  def create
    new_user = User.create(user_params)
    if new_user.save
      render json: new_user
    else
      render error_message("please try again.")
    end
  end

  def delete
  end

  private
  def user_params
    params.permit(:id)
  end

  def user
    User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :date_of_birth)
  end

  def error_message(error)
    "Something went wrong, #{error}"
  end
end
