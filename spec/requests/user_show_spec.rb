require 'rails_helper'

describe 'when it receives a get request to "/api/v1/users"' do
  describe 'with the correct parameters' do
    before do
      @user = FactoryBot.create(:user, password: "password")
    end

    it 'shows user details' do
      post '/api/v1/user', params: {
        email: @user.email,
        password: "password"
      }, as: :json

      expect(JSON.parse(response.body, symbolize_names: true)).to eq(data: {id: "#{@user.id}", type: "users", attributes: {email: @user.email, api_key: @user.api_key}})
    end

    #edge case testing begins here
    it 'cant show a user that doesnt exist' do
      post '/api/v1/user', params: {
        email: "doesntexist@sample.com",
        password: "password"
      }, as: :json

      expect(response.status).to eq(400)
      expect(JSON.parse(response.body)).to eq("Email or Password is incorrect.")
    end

    it 'cant authenticate a found user with incorrect pw' do
      post '/api/v1/user', params: {
        email: @user.email,
        password: "wrong password"
      }, as: :json

      expect(response.status).to eq(400)
      expect(JSON.parse(response.body)).to eq("Email or Password is incorrect.")
    end
  end
end
