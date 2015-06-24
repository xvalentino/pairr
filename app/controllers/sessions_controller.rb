class SessionsController < ApplicationController
  skip_before_filter :require_login

  def create
    req = request.env["omniauth.auth"]
    @user = User.find_or_create_by_auth(req)
    session[:user_id] = @user.id
    if current_user.description == nil || current_user.languages.empty?
      redirect_to edit_user_path(@user)
    else
      redirect_to root_path, notice: "Logged in as #{@user.name}"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  def show
  end
end
