class AdminController < ApplicationController

  def show
    pitches = Pitch.all
    redirect show_admin
  end

private
def set_user
  @user = User.find_by(id: params[:id])
end
