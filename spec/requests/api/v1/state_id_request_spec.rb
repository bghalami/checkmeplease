require 'rails_helper'
require 'pry'

describe "user visits state id endpoints" do
  describe "user views users state id" do
    it "should display state id info" do
      user = create(:user)
      user.state_id = create(:state_id)
      get "/api/v1/users/#{user.id}/state_id"

      expect(response).to be_successful

      body = JSON.parse(response.body)
      assertion = {
        "id_number" => 40,
        "state" => "California",
        "expiration_date" => "2000-08-11(EXPIRED)",
        "path_to_image" => "/file/file/file.jpg"
      }
      expect(body).to eq(assertion)
    end
  end
  describe "user deletes state_id" do
    it "should delete state_id from db" do
      user = create(:user)
      user.state_id = create(:state_id)
      delete "/api/v1/users/#{user.id}/state_id"

      expect(response).to be_successful

      body = JSON.parse(response.body)
      expect(body).to eq({"message" => "StateId for User 1 successfully deleted"})
      expect(StateId.find_by(user_id: user.id)).to eq(nil)
    end
  end
  describe "user creates state_id" do
    it "should create state_id in db" do
      user = create(:user)
      expect(user.state_id).to eq(nil)

      post_params = { "state_id" => {
        "id_number" => 40,
        "state" => "California",
        "expiration_date" => "2000-08-11(EXPIRED)",
        "path_to_image" => "/file/file/file.jpg" }
      }
      post "/api/v1/users/#{user.id}/state_id", :params => post_params

      expect(response).to be_successful

      body = JSON.parse(response.body)
      assertion = {
        "id_number" => 40,
        "state" => "California",
        "expiration_date" => "2000-08-11(EXPIRED)",
        "path_to_image" => "/file/file/file.jpg"
      }
      expect(body).to eq(assertion)
      expect(StateId.find_by(user_id: user.id)).to_not be(nil)
    end
  end
  describe "user creates state_id" do
    describe "user already has state_id" do
      it "should return error message" do
        user = create(:user)
        user.state_id = create(:state_id)
        post_params = { "state_id" => {
          "id_number" => 40,
          "state" => "California",
          "expiration_date" => "2000-08-11(EXPIRED)",
          "path_to_image" => "/file/file/file.jpg" }
        }
        post "/api/v1/users/#{user.id}/state_id", :params => post_params

        body = JSON.parse(response.body)

        expect(body).to eq({"message" => "User 1 already has a State ID"})
      end
    end
  end
end
