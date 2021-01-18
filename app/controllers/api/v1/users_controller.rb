class Api::V1::UsersController < ApplicationController
  def create
    render json: UsersSerializer.new(UsersFacade.create_user(create_params))
  end

  private

  def create_params
    JSON.parse(request.body.read, symbolize_names: true)
  end
end
