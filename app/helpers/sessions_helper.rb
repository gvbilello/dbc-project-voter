module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user?(user)
    user == current_user
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
    redirect_to user_path(user) unless user.admin?
    return
    redirect_to admin_path(user) # this works, but need path to admin_dashboard
  end

  def redirect_back_or(default)
    redirect_to(session[:forarding_url] || default)
    session.delete(:forarding_url) #session deletion occurs before redirect. Redirects occur at end of method unless explicitly returned
  end

  def store_location
    session[:forarding_url] = request.original_url if request.get?
  end
end
