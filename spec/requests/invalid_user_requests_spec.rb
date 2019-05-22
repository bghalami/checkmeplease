require 'rails_helper'

describe "user visits endpoint with invalid user id" do
  describe "user visits /user endpoint" do
    it "should say no user with that id" do
      get '/api/v1/users/100000'
      user_response = JSON.parse(response.body)
      expect(user_response).to eq({"message" => "No User found with ID 100000"})
    end
  end
  describe "user visits /user/:user_id/state_id endpoint" do
    it "should say no user with that id" do
      get '/api/v1/users/100000/state_id'
      user_response = JSON.parse(response.body)
      expect(user_response).to eq({"message" => "No User found with ID 100000"})
    end
  end
  describe "user visits /user/:user_id/medical_recommendation endpoint" do
    it "should say no user with that id" do
      get '/api/v1/users/100000/medical_recommendation'
      user_response = JSON.parse(response.body)
      expect(user_response).to eq({"message" => "No User found with ID 100000"})
    end
  end
end
