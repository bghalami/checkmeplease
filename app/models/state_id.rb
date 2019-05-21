class StateId < ApplicationRecord
  validates_presence_of :id_number, :state, :expiration_date, :path_to_image
  belongs_to :user

  def self.delete_me(state_id, user_id)
    if state_id.destroy
      "{\"message\": \"StateId for User #{user_id} successfully deleted\"}"
    else
      error_message
    end
  end

  def self.create_me(state_id, user_id, state_id_params)
    user = User.find_by_id(user_id)
    if user.state_id == nil
      user.state_id = StateId.create(state_id_params)
      if user.state_id.save
        user.state_id
      else
        error_message
      end
    else
      "{\"message\": \"User #{user_id} already has a State ID\"}"
    end
  end
end
