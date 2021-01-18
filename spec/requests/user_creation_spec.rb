require 'rails_helper'

describe 'When a POST request is sent to "/api/v1/users"' do
  describe 'and it has a body with the right information in the right format' do
    it 'should create a new user' do
      allow(SecureRandom).to receive(:base64).and_return("h8l2ab&^*RTTY4l=")

      post '/api/v1/users', params: {
                                      headers: {"ACCEPT": "application/json"},
                                      body: {
                                              "email": "whatever@example.com",
                                              "password": "password",
                                              "password_confirmation": "password"
                                            }
                                    }


      last_user = User.last
      expect(last_user).to be_valid
      expect(request.params[:body]["email"]).to eq(last_user.email)
      expect(last_user.api_key).to eq("h8l2ab&^*RTTY4l=")
    end

    #thus begins the edge testing
    it 'can\'t create a user without the right setup' do
      expect {post '/api/v1/users', params: { email: "whatever@example.com",
                                      password: "password",
                                      password_confirmation: "password"
                                    }}.to raise_error(ActionController::ParameterMissing)
    end
  end
end
