class UsersController < ApplicationController
  before_action :logged_in_user, :find_and_ensure_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:show, :edit, :update]

  def new
    @cohorts = Cohort.order(:name)
  end

  def create
    @cohorts = Cohort.order(:name)
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Thank you for creating an account!'
      protected(user)
    else
      @errors = user.errors.full_messages
      render 'new'
    end
  end

  def show
    if current_user.admin
      redirect_to admin_path(current_user)
    else
      @first_round = Round.where(name: "first")
      @second_round = Round.where(name: "second")
      @final_round = Round.where(name: "final")
      # binding.pry
      @first_round_pitches = Pitch.where(round_id: @first_round.ids[0])
      @second_round_pitches = Pitch.where(round_id: @second_round.ids[0])
      @final_pitches = Pitch.where(round_id: @final_round.ids[0])

      @pitches = []
      Pitch.all.each do |pitch|
        @pitches << pitch if pitch.user.cohort == @user.cohort
      end
      binding.pry
      render 'show_student'
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      @errors = @user.errors.full_messages
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :username, :email, :cohort_id, :password, :password_confirmation)
    end

    def find_and_ensure_user
      @user = User.find_by(id: params[:id]) #if set to session[:user_id] then this will always evaluate to true for correct_user?
    end

    def correct_user
      redirect_to root_url unless current_user?
    end
end
