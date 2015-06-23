class SessionsController < ApplicationController
  skip_before_filter :require_login

  def create
    req = request.env["omniauth.auth"]
    @user = User.find_or_create_by_auth(req)
    session[:user_id] = @user.id
    redirect_to root_path, notice: "Logged in as #{@user.name}"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def show
  end
end
