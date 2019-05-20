require 'rails_helper'

RSpec.describe StateId, type: :model do
  describe "validations" do
    it {should validate_presence_of(:id_number)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:expiration_date)}
    it {should validate_presence_of(:path_to_image)}
    it {should belong_to(:user)}
  end
end
