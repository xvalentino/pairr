class DashboardController < ApplicationController
  def home
    @user = current_user
    @matches = current_user.matches
  end
end
