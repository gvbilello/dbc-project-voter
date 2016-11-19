class AdminsController < ApplicationController
  
  def show
    @pitches = Pitch.all
    @cohorts = Cohort.all
    render :show
  end

  private
  def set_admin
    @admin = User.find_by(id: params[:id])
  end

end
