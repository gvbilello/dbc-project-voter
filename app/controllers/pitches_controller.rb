class PitchesController < ApplicationController
  before_action :sanitize_params, only: [:create]
  def index
  end

  def new
  end

  def create
    binding.pry
    @pitch = Pitch.new(pitch_params)
    if @pitch.save
      redirect_to :back
    end
  end

  def edit

  end

  def update_index

  end

  def update

  end

  def destroy
    @pitch.update_attributes(pitch_params)
  end

  private

  def pitch_params
    params.require(:pitch).permit(:working_title, :description, :user_id, :round_id)
  end

  def sanitize_params
    params[:pitch][:round_id] = Round.last.id
    params[:pitch][:user_id] = current_user.id
  end


end
