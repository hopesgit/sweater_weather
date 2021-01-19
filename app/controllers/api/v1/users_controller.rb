class Api::V1::UsersController < ApplicationController
  def show
    user_data = UsersFacade.show_user(create_params)
    if user_data == "Email or Password is incorrect."
      render json: user_data.to_json, status: 400
    else
      render json: UsersSerializer.new(user_data)
    end
  end

  def create
    render json: UsersSerializer.new(UsersFacade.create_user(create_params))
  end

  private

  def create_params
    JSON.parse(request.body.read, symbolize_names: true)
  end
end
