class Api::V1::UsersController < ApplicationController
  def create
    if user_params[:password_confirmation].nil?
      raise StandardError.new "Password confirmation missing".to_json
    else
      User.create!(
        email: user_params[:email],
        password: user_params[:password],
        password_confirmation: user_params[:password_confirmation],
        api_key: ApiKeyCreator.generate_api_key
      )
    end
  end

  private
  def user_params
    params.require(:body).permit(:email, :password, :password_confirmation)
  end
end
