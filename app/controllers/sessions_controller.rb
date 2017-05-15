class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    @user = User.find_or_create_from_omniauth(request.env['omniauth.auth'])
    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to root_path, notice: "We were unable to authenticate your information"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Signed out!"
  end
end
