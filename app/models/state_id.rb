class StateId < ApplicationRecord
  validates_presence_of :id_number, :state, :expiration_date, :path_to_image
  belongs_to :user
end
