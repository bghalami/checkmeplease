class User < ApplicationRecord
  has_one :state_id,  dependent: :destroy
  has_one :medical_recommendation,  dependent: :destroy 
  validates_presence_of :name, :email_address, :date_of_birth
end
