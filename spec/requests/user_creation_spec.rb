require 'rails_helper'

describe 'When a POST request is sent to "/api/v1/users"' do
  before :each do
    User.destroy_all
  end

  describe 'and it has a body with the right information in the right format' do
    it 'should create a new user' do
      allow(SecureRandom).to receive(:base64).and_return("h8l2ab&^*RTTY4l=")

      post '/api/v1/users', params: {
                                      "email": "whatever@example.com",
                                      "password": "password",
                                      "password_confirmation": "password"
                                    }, as: :json

      last_user = User.last
      expect(last_user).to be_valid
      expect(request.params["email"]).to eq(last_user.email)
      expect(last_user.api_key).to eq("h8l2ab&^*RTTY4l=")
    end

    #thus begins the edge testing
    it 'can\'t create a user if password_confirmation field is missing' do
      expect {post '/api/v1/users', params: {
                                              "email": "whatever22@example.com",
                                              "password": "password"
                                            }, as: :json
              }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'can\'t create a user if password field is missing' do
      expect {post '/api/v1/users', params: {
                                              "email": "whatever25@example.com",
                                              "password_confirmation": "password"
                                            }, as: :json
              }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'can\'t create a user if email field is missing' do
      expect {post '/api/v1/users', params: {
                                              "password": "password",
                                              "password_confirmation": "password"
                                            }, as: :json
              }.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'can\'t create a user if passwords don\'t match' do
      request_body = {email: "whateverman@example.com", password: "password",    password_confirmation: "password2"}

      expect {post '/api/v1/users', params: request_body, as: :json}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'can\'t create a user if no params given' do
      expect {post '/api/v1/users', as: :json}.to raise_error(JSON::ParserError)
    end
  end
end
