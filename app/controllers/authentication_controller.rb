# app/controllers/authentication_controller.rb

class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request, only :authenticate

  def authenticate
    command = AuthenticateUser.new(auth_params[:email], auth_params[:password])

    if command.success?
      render json: { auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end
  private

  def auth_params
    params.permit(:email, :password, :authentication)
  end
end
