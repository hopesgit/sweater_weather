class UsersFacade
  def self.create_user(user_params)
    User.create!(
        email: user_params[:email],
        password: user_params[:password],
        password_confirmation: enforce_password_confirmation(user_params[:password_confirmation]),
        api_key: ApiKeyCreator.generate_api_key
      )
  end

  private
  def self.enforce_password_confirmation(confirmation)
    if confirmation.nil?
      ""
    else
      confirmation
    end
  end
end
