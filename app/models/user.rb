class User < ApplicationRecord
  validates_presence_of :name, :email_address, :date_of_birth
end
