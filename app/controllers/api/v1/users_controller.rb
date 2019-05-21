class Api::V1::UsersController < ApplicationController

  def index
    render json: User.all
  end

  def show
    if user
      render json: user
    else
      render json: "No User found with ID #{params[:id]}"
    end
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
      render error_message
    end
  end

  def destroy
    if user.destroy
      render json: "User #{params[:id]} and related data successfully deleted"
    else
      render error_message
    end
  end

  private
  def user
    User.find_by_id(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email_address, :date_of_birth)
  end

  def error_message
    "Something went wrong, please try again."
  end
end
