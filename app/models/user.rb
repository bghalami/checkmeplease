class User < ApplicationRecord
  has_one :state_id,  dependent: :destroy
  has_one :medical_recommendation,  dependent: :destroy
  validates_presence_of :name, :email_address, :date_of_birth

  def self.create_me(user_params)
    new_user = User.create(user_params)
    if new_user.save
      new_user
    else
      "{\"message\": \"Something went wrong, please try again.\"}"
    end
  end

  def self.destroy_me(user,params)
    "{\"message\":\"User #{params[:id]} and related data successfully deleted\"}" if user.destroy
  end

  def self.update_me(user, user_params)
    user if user.update!(user_params)
  end
end
