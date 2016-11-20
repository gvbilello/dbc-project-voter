class PitchesController < ApplicationController

  def index
  end

  def new
  end

  def create

      puts "================"
      puts "================"
      puts "================"
      puts "================"
      puts "================"
      puts "================"
      puts "================"
      puts "================"
      puts "================"
      puts "================"
      puts "================"
      puts "================"
      puts "================"
      puts "================"

    @pitch = Pitch.new(pitch_params)
    if @pitch.save

      render 'new'
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
