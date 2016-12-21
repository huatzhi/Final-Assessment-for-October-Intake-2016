module ApplicationHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def authorize
    redirect_to login_url, alert: 'Please login first.' if current_user.nil?
  end

  def authorize_admin
    redirect_to root_url, alert: 'Only admin can do that.' if !current_user.nil? && current_user.type == 'admin'
  end
end
