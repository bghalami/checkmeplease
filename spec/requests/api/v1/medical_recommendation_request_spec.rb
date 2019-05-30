require 'rails_helper'

describe "user visits medical recommendation endpoints" do
  describe "user views users medical recommendation" do
    it "should display medical recommendation info" do
      user = create(:user)
      user.medical_recommendation = create(:medical_recommendation)
      get "/api/v1/users/#{user.id}/medical_recommendation"

      expect(response).to be_successful

      body = JSON.parse(response.body)
      assertion = {
        "expiration_date"=>"2000-08-11(EXPIRED)",
        "issuer"=>"Dr Dokter",
        "path_to_image"=>"/file/file/file.jpg",
        "recommendation_number"=>20,
        "state"=>"California"
      }
      expect(body).to eq(assertion)
    end
  end
  describe "user deletes medical recommendation" do
    it "should delete medical recommendation from db" do
      user = create(:user)
      user.medical_recommendation = create(:medical_recommendation)
      delete "/api/v1/users/#{user.id}/medical_recommendation"

      expect(response).to be_successful

      body = JSON.parse(response.body)
      expect(body).to eq({"message" => "Medical Recommendation for User 1 successfully deleted"})
      expect(MedicalRecommendation.find_by(user_id: user.id)).to eq(nil)
    end
  end
  describe "user creates medical recommendation" do
    it "should create medical recommendation in db" do
      user = create(:user)
      expect(user.medical_recommendation).to eq(nil)

      post_params = { "medical_recommendation" => {
        "expiration_date"=>"2000-08-11",
        "issuer"=>"Dr Dokter",
        "path_to_image"=>"/file/file/file.jpg",
        "recommendation_number"=>20,
        "state"=>"California"}
      }
      post "/api/v1/users/#{user.id}/medical_recommendation", :params => post_params

      expect(response).to be_successful

      body = JSON.parse(response.body)
      assertion = {
        "expiration_date"=>"2000-08-11(EXPIRED)",
        "issuer"=>"Dr Dokter",
        "path_to_image"=>"/file/file/file.jpg",
        "recommendation_number"=>20,
        "state"=>"California"
      }
      expect(body).to eq(assertion)
      expect(MedicalRecommendation.find_by(user_id: user.id)).to_not be(nil)
    end
  end
  describe "user creates medical recommendation" do
    describe "user already has medical recommendation" do
      it "should return error message" do
        user = create(:user)
        user.medical_recommendation = create(:medical_recommendation)
        post_params = { "medical_recommendation" => {
          "expiration_date"=>"2000-08-11",
          "issuer"=>"Dr Dokter",
          "path_to_image"=>"/file/file/file.jpg",
          "recommendation_number"=>20,
          "state"=>"California"}
        }
        post "/api/v1/users/#{user.id}/medical_recommendation", :params => post_params

        body = JSON.parse(response.body)

        expect(body).to eq({"message" => "User 1 already has a Medical Recommendation"})
      end
    end
  end
  describe "user updates medical recommendation" do
    it "should return updated medical recommendation" do
      user = create(:user)
      user.medical_recommendation = create(:medical_recommendation)
      expect(user.medical_recommendation.state).to eq("California")
      put_params = { "medical_recommendation" => {
        "state" => "New York" }
      }
      put "/api/v1/users/#{user.id}/medical_recommendation", :params => put_params

      body = JSON.parse(response.body)
      assertion = {
        "expiration_date"=>"2000-08-11(EXPIRED)",
        "issuer"=>"Dr Dokter",
        "path_to_image"=>"/file/file/file.jpg",
        "recommendation_number"=>20,
        "state"=>"New York"
      }
      expect(body).to eq(assertion)
    end
  end
end
