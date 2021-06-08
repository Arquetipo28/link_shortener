class ApplicationController < ActionController::Base
  def authenticate_user
    if request.headers['Authorization'].present?
      authenticate_or_request_with_http_token do |token|
        begin
          jwt_payload =JWT.decode(token, Rails.application.secreats.secret_key_base.first)

          @current_user = User.find(jwt_payload['id'])
        rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
          head :unauthorized
        end
      end
    end
  end
end
