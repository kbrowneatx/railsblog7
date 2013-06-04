class CommentsController < ApplicationController
  before_filter :set_current_user
  
  def index
	@user = User.find(params[:user_id])
	@comments = @user.comments
  end
end
