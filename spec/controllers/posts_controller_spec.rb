require 'spec_helper'

describe PostsController do
	describe new do
		it "requires a name and content" do
			p = Post.new(title:"This is Title text.", content:"This is the content text.", user_id: 1).should be_an_instance_of Post
		end
		
		it "requires a user_id" do
			
		end
	end
	
end