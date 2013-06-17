class PostsController < ApplicationController
  load_and_authorize_resource
  before_filter :find_post, except: [:index, :new, :create]
  before_filter :set_current_user
  
  def index
		@posts = Post.search(params[:search]).paginate(:page => params[:page], :per_page => 3)
  end

  def show
		@comments = @post.comments.order('created_at DESC')
		@newcomment = @post.comments.new
  end

  def new
		@post = Post.new
  end

  def create
		@post = Post.new(params[:post])
		@post.user_id = @user.id
		if @post.save
			redirect_to @post
		else
			render :edit
		end
  end

  def edit
  end

  def update
    # if comment
    if params[:post].has_key?(:comments_attributes)
	  params[:post][:comments_attributes]['0'][:user_id] = @user.id
    end

		if @post.update_attributes(params[:post])
			redirect_to @post
		else
			render :edit
		end
  end

  def destroy
		if @post.destroy
			redirect_to posts_path
		else
			flash[:error] = "Error deleting post. Try again or contact sysadmin"
			redirect_to @post
		end
  end
  
  def find_post
		@post = Post.find(params[:id])
  end
end
