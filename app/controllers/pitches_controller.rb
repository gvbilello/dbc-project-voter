class PitchesController < ApplicationController

  def index
  end

  def new
  end

  def create
    # create pitch and add to list of pitches with ajax
    # currently incomplete
    @pitch = Pitch.new(pitch_params)
    if @pitch.save
      if request.xhr?
        # return pitch partial
      end
      # redirect
    else
      user = @pitch.user
      @errors = pitch.errors.full_messages
      render user
    end
  end

  def edit
  end

  def update_index
    # binding.pry
    @cohorts = Cohort.all
    @pitches = Pitch.where(selected: false)
    if params[:commit] == "Select Final Pitches"
      # redirect to final round
    elsif params[:commit] == "Select Top Pitches"
      @round = Round.new(name: "second", can_vote: true)
      if @round.save
        # something
        @second_round_pitches = Pitch.where(selected: true)
        @second_round_pitches.each do |pitch|
          pitch.update_attributes(round_id: @round.id, selected: false)
        end
        # binding.pry
        render 'admins/show'
      else
        @errors = @round.errors.full_messages
        render current_user
      end
    else
      pitch = Pitch.find_by(id: params[:pitch_id])
      if pitch.update_attributes(selected: true)
        flash[:succes] = "Pitch Selected"
        redirect_to current_user
      else
        @errors = current_user.errors.full_messages
      end
    end
  end

  def update
  end

  def destroy
  end

  private
    def pitch_params
      params.require(:pitch).permit(:working_title, :description)
    end

end
