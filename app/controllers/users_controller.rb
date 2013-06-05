class UsersController < ApplicationController
  def index
	@users = User.in_AtoZ
	@avids = User.avidreader.map{|u| u.id}
  end

  def show
	@user = User.find(params[:id])
  end

  def new
	@user = User.new
  end

  def create
	@user = User.new(params[:user])
	if @user.save
		redirect_to @user
	else
		render :edit
	end
  end

  def edit
	@user = User.find(params[:id])	
  end

  def update
  	@user = User.find(params[:id])
	if @user.update_attributes(params[:user])
		redirect_to @user
	else
		render :edit
	end
  end

  def destroy
  	@user = User.find(params[:id])
	if @user.destroy
		redirect_to users_path
	else
		flash[:error] = "Error deleting user. Try again or contact sysadmin"
		redirect_to @user
	end
  end
end
