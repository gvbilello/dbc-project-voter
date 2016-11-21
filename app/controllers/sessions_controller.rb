class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to admin_path(user) unless protected(user)
    else
      flash[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to signin_path
  end
end
