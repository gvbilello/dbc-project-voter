class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      # redirect_back_or user will change when Greg & Nan include user/admin dashboard
      redirect_to '/'
    else
      flash[:danger] = 'Invalid email or password'
      render 'new'
    end
  end

  def destroy
    session.clear
    redirect_to signin_path #will change to root page when I have static page
  end
end
