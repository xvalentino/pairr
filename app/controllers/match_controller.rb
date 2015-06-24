class MatchController < ApplicationController
  def show
    @random_user = current_user.queue || User.new(name: "THERE ARE NO MORE PEOPLE IN THIS APP FOR YOU.")
  end

  def update
    pair = Pair.find_or_create_by(current_user.id, params[:id])
    pair.up
    if pair.status == 2
      flash[:notice] = "NICE #{current_user.name}, you have a match!"
    end
    redirect_to match_path
  end

  def destroy
    pair = Pair.find_or_create_by(current_user.id, params[:id])
    pair.down
    redirect_to match_path
  end
end
