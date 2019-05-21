class Api::V1::StateIdsController < ApplicationController

  def show
    if state_id
      render json: state_id
    else
      render json: "{\"message\": \"User #{user_id} has no State ID\"}"
    end
  end

  def update
    state_id.update!(state_id_params)
    render json: state_id
  end

  def create
    user = User.find_by_id(user_id)
    if user.state_id == nil
      user.state_id = StateId.create(state_id_params)
      if user.state_id.save
        render json: user.state_id
      else
        error_message
      end
    else
      render "User #{user_id} already has a State ID"
    end
  end

  def destroy
    if state_id.destroy
      render json: "StateId for User #{user_id} successfully deleted"
    else
      render error_message
    end
  end

  private
  def user_id
    params.permit(:user_id)[:user_id]
  end

  def state_id
    StateId.find_by(user_id: user_id)
  end

  def state_id_params
    params.require(:state_id).permit(:id_number, :state, :expiration_date, :path_to_image)
  end
end
