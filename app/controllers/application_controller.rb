class ApplicationController < ActionController::Base
  protect_from_forgery
  check_authorization :unless => :devise_controller?
  
  private
  
  def set_current_user
	if user_signed_in?
		@user = current_user
	else
		redirect_to new_user_session_path
	end
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to posts_path, :alert => exception.message
  end
end
