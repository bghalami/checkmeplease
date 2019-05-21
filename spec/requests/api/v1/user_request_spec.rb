require 'rails_helper'
require 'pry'
describe "user visits user endpoints" do
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
  describe "user sees single user" do
    describe "they visit '/api/v1/users/:id" do
      # it "displays the info of a single user" do
      #
      #   user = create(:user)
      #
      #   get "/api/v1/users/#{user.id}"
      #
      #   expect(response).to be_successful
      #
      #   response_user = JSON.parse(response.body)
      #
      #   expect(response_user).to eq()
      # end
    end
  end
end
