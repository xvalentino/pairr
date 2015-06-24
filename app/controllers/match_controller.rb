class MatchController < ApplicationController
  def show
    @random_user = current_user.random_user
  end

  def update
    pair = Pair.find_or_create_by(current_user.id, params[:id])
    pair.up
    redirect_to match_path
  end

  def destroy
    pair = Pair.find_or_create_by(current_user.id, params[:id])
    pair.down
    redirect_to match_path
  end
end