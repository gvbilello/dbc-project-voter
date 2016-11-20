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
