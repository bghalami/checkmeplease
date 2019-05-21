class User < ApplicationRecord
  has_one :state_id,  dependent: :destroy
  has_one :medical_recommendation,  dependent: :destroy
  validates_presence_of :name, :email_address, :date_of_birth

  def self.create_me(user_params)
    new_user = User.create(user_params)
    if new_user.save
      new_user
    else
      error_message
    end
  end

  def self.destroy_me(user)
    if user.destroy
      "{\"message\":\"User #{params[:id]} and related data successfully deleted\"}"
    else
      error_message
    end
  end
end
