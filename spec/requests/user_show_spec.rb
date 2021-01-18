# require 'rails_helper'
#
# describe 'when it receives a get request to "/api/v1/users"' do
#   describe 'with the correct parameters' do
#     before do
#       @user = User.create(
#         email: "whatever2@example.com",
#         password: "password",
#         password_confirmation: "password",
#         api_key: SecureRandom.base64
#       )
#     end
#
#     it 'shows user details' do
#       get '/api/v1/user', params: {
#         email: "whatever2@example.com",
#         password: "password"
#       }, as: :json
#
#       expect(JSON.parse(response.body)).to eq(id: @user.id, type: @user.class.to_s, data: {email: @user.email, api_key: @user.api_key})
#     end
#   end
# end
