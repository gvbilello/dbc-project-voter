class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    # binding.pry
    if params["commit"] == "Final Vote Rankings"
      @vote = Vote.new(vote_ranking_params)
      if @vote.save
        flash[:notice] = "thank you for submitting your rankings"
      else
        flash[:danger] = "rankings not saved"
      end
    else
      @vote = Vote.new(vote_params)
      if @vote.save
        flash[:notice] = "thank you for voting"
      else
        flash.now[:danger] = "vote did not save"
      end
    end
  end

  private
    def vote_params
      # binding.pry
      params.require(:vote).permit(:user_id, :pitch_id, :round_id)
    end

    def vote_ranking_params
      params.require(:vote).permit(:user_id, :pitch_id, :round_id, :ranking)
    end
end
