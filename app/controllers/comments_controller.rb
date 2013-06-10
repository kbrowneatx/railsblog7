class CommentsController < ApplicationController
  load_and_authorize_resource :post
  load_and_authorize_resource :through => :post

  skip_authorize_resource :only => :show  
  skip_authorize_resource :post, :only => :show
  
  before_filter :set_current_user
  
  def index
	@user = User.find(params[:user_id])
	@comments = @user.comments
  end
end
