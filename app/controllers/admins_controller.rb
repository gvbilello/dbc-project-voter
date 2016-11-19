class AdminsController < ApplicationController

  def show
    @pitches = Pitch.all.sort_by { |pitch| pitch.votes.count }.reverse
    @cohorts = Cohort.all
    render :show
  end

  private
  def set_admin
    @admin = User.find_by(id: params[:id])
  end

end
