class Api::V1::SessionsController < ApplicationController

  def create
    user_password = params[:session][:password]
    user_login = params[:session][:login]

    user = user_login.present? && User.find_by(email: user_login)

    if user.present? and user.valid_password? user_password
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      render json: user, status: 200, location: [:api, user]
    else
      render json: { errors: {credentials: ["Invalid email or password"] }}, status: 422
    end

  end
  
  def destroy
    auth_token = request.headers["Authorization"]
    user = User.find_by(auth_token: auth_token)
    user.generate_authentication_token!
    user.save
    head 204
  end
end
