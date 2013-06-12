require 'spec_helper'

describe Post do

  before :each do
		@post1 = Post.create!(title: 'Post1', content: 'body1')
		@post2 = Post.create!(title: 'Post2', content: 'body2')
		@post3 = Post.create!(title: 'Post3', content: 'body3')
		@post4 = Post.create!(title: 'Post4', content: 'body4')
		@post5 = Post.create!(title: 'Post5', content: 'body5')
  end

  it "fetches posts in batches of three" do
    expect(Post.recent.length).to eq(3)
  end
end