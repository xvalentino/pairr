class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update_profile(params)
      redirect_to root_path
    else
      render :edit
    end
  end
end
