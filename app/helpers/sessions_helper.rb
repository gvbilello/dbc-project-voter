module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user?
    find_and_ensure_user
    @user == current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def admin?
    !!current_user.admin
  end

  def protected(user)
    redirect_to user_path(user) unless user.admin? #probably current_user
  end

  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Please log in'
      redirect_to signin_url
    end
  end

  def redirect_back_or(default)
    redirect_to(session[:forarding_url] || default)
    session.delete(:forarding_url)
  end

  def store_location
    session[:forarding_url] = request.original_url if request.get?
  end
end
