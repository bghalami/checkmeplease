require 'rails_helper'

describe "user sees all users" do
  describe "they visit '/api/v1/users/" do
    it "displays all articles" do
      create_list(:user, 3)

      get '/api/v1/users'

      expect(response).to be_successful

      users = JSON.parse(response.body)

      expect(users.count).to eq(3)
    end
  end
end
