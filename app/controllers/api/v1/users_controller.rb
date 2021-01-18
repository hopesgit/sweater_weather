class Api::V1::UsersController < ApplicationController
  def create
    render json: UsersSerializer.new(UsersFacade.create_user(user_params))
  end

  private
  def user_params
    params.require(:body).permit(:email, :password, :password_confirmation)
  end
end
