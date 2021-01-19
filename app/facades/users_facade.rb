class UsersFacade
  def self.show_user(user_params)
    user = User.find_by(email: user_params[:email])
    if user.nil?
      "Email or Password is incorrect."
    else
      if user.authenticate(user_params[:password])
        user
      else
        "Email or Password is incorrect."
      end
    end
  end

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
