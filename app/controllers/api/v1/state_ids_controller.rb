class Api::V1::StateIdsController < ApplicationController

  def show
    render json: state_id
  end

  def update
    state_id.update!(state_id_params)
    render json: state_id
  end

  def create
    if state_id == nil
      user.state_id = StateId.new(state_id_params)
      if user.state_id.save
        render json: state_id
      else
      render json: "{\"message\": \"Something went wrong, please try again.\"}"
      end
    else
      render json: "{\"message\": \"User #{user.id} already has a State ID\"}"
    end
  end

  def destroy
    render json: "{\"message\": \"StateId for User #{user.id} successfully deleted\"}" if state_id.destroy
  end

  private
  def user
    User.find_by_id(params[:user_id])
  end

  def state_id
   user.state_id
  end

  def state_id_params
    params.require(:state_id).permit(:id_number, :state, :expiration_date, :path_to_image)
  end
end
