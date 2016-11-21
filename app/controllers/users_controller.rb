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
      rounds = @user.rounds.distinct
      @first_round = rounds.select { |round| round.name == "first" }[0]
      @second_round = rounds.select { |round| round.name == "second" }[0]
      @final_round = rounds.select { |round| round.name == "final" }[0]

      @pitches = []
      Pitch.all.each do |pitch|
        @pitches << pitch if pitch.user.cohort == @user.cohort
      end
      render 'show_student'
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
