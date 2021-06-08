class Users::SessionsController < Devise::SessionsController
  def create
    user = User.find_by_email(sign_in_params[:email])

    if user && user.valid_password?(sign_in_params[:password])
      response.set_header('Access-Token', user.generate_token)
    else
      render json: { errors: { 'email or password': ['is invalid!'] } }, status: :unprocessable_entity
    end
  end
end
