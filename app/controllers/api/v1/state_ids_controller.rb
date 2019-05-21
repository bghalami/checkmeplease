class Api::V1::StateIdsController < ApplicationController

  def show
    render json: StateId.show_me(state_id, user_id)
  end

  def update
    state_id.update!(state_id_params)
    render json: state_id
  end

  def create
    render json: StateId.create_me(state_id, user_id, state_id_params)
  end

  def destroy
    render json: StateId.delete_me(state_id, user_id)
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
