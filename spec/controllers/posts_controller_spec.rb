require 'spec_helper'

describe PostsController do
	describe new do
		it "requires a name and content" do
			p = Post.new
			p.title = "This is Title text."
			p.content = "This is the content text."
			p.user_id = 1
			p.should be_an_instance_of Post
		end
		
		it "requires a user_id" do
			
		end
	end
	
end