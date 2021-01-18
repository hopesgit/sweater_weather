class Api::V1::UsersController < ApplicationController
  def create
    render json: UsersSerializer.new(UsersFacade.create_user(user_params))
  end

  private
  def user_params
    JSON.parse(request.body.read, symbolize_names: true)
  end
end
