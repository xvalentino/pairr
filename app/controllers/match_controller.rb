class MatchController < ApplicationController
  def show
    @random_user = current_user.not_attempted_with.sample
  end
end
