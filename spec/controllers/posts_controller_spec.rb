require 'spec_helper'

describe PostsController do
	before :each do
		@post1 = Post.create!(title: 'This is the title', content: 'This is the body text')
		@post2 = Post.create!(title: 'This is the title', content: 'This is the body text')
		@user1 = User.create!(name:'Joe', email:'joe@foo.net', password: 'password', password_confirmation: 'password', bio:'this is my life', role:'admin')
	end
  describe "GET #index" do
    it "loads all of the posts into @posts" do
      get :index
      expect(assigns(:posts)).to match_array([@post1, @post2])
    end
  end
  describe "PUT #update" do
    it "all post attributes are mass assignable" do
      @post1.title = 'New Title'
      @post1.content = 'New body text for content'
      @post1.user_id = @user1.id
			
      @post1.title.should eql('New Title')
      @post1.content.should eql('New body text for content')
      @post1.user_id.should eql(@user1.id)
    end

    it "posts accept new comments" do
      comment1 = @post1.comments.create
			comment1.content = 'New body text for comment'
      comment1.user_id = @user1.id
			
      @post1.comments.last.content.should eql('New body text for comment')
      @post1.comments.last.user_id.should eql(@user1.id)
    end
  end
end