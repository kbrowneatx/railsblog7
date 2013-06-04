class HomeController < ApplicationController
  before_filter :redirect_to_posts
  
  def index
	@users = User.all
	@user = User.new
  end
  
  def redirect_to_posts
	redirect_to posts_path if session[:current_user_id]
  end
end