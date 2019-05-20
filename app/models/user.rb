class User < ApplicationRecord
  has_one :state_id
  has_one :medical_recommendation
  validates_presence_of :name, :email_address, :date_of_birth
end
