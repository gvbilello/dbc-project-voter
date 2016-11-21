class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      flash[:notice] = "thank you for voting"
    else
      flash.now[:danger] = "vote did not save"
    end
  end

  private
    def vote_params
      binding.pry
      params.require(:vote).permit(:user_id, :pitch_id, :round_id)
    end
end
