require 'rails_helper'

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
      it "displays the info of a single user" do

        user = create(:user)

        get "/api/v1/users/#{user.id}"

        expect(response).to be_successful

        response_user = JSON.parse(response.body)

        expect(response_user).to eq({"id"=>1, "name"=>"Ben", "email_address"=>"ben@ben.com", "date_of_birth"=>"2000-08-11", "state_id"=>nil, "medical_recommendation"=>nil})
      end
    end
  end
  describe "user enters invalid user id" do
    describe "they visit 'api/v1/users/flip'" do
      it "displays an error message" do
        get "/api/v1/users/flip"

        expect(response).to be_successful

        response_user = JSON.parse(response.body)

        expect(response_user).to eq({"message"=>"No User found with ID flip"})
      end
    end
  end
  describe "user creates new user" do
    describe "user is successfully created" do
      it "should return user created" do
        date = Date.parse('09-09-2010')
        post "/api/v1/users", :params => {:user => { "name" => "Ben", "email_address" => "Ben@Ben.com", "date_of_birth" => "#{date}"} }

        expect(response).to be_successful

        response_user = JSON.parse(response.body)

        expect(response_user).to eq({"date_of_birth"=>"2010-09-09", "email_address"=>"Ben@Ben.com", "id"=>1, "medical_recommendation"=>nil, "name"=>"Ben", "state_id"=>nil})
      end
    end
    describe "user is unsuccessfully created" do
      it "should return an error message" do

        post "/api/v1/users", :params => {:user => { "name" => "Ben" }}
        response_user = JSON.parse(response.body)

        expect(response_user).to eq({"message" => "Something went wrong, please try again."})
      end
    end
  end
  describe "user updates user" do
    describe "user successfully updates user" do
      it "Should return user updated" do
        user = create(:user)
        expect(user.name).to eq("Ben")

        put "/api/v1/users/#{user.id}", :params => {"user" => {"name" => "Ren"}}

        user = User.find_by_id(user.id)

        expect(user.name).to eq("Ren")
      end
    end
  end
  describe "user deletes user" do

  end
end
