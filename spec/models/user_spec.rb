require 'spec_helper'

describe User do
  before :each do
		@user1 = User.create!(name:'Dennis',email:'dennis@foo.net',password:'password',password_confirmation:'password')
		@user2 = User.create!(name: 'Bruce', email: 'bruce@foo.net',password:'password',password_confirmation:'password')
		@user3 = User.create!(name: 'Adam', email: 'adam@foo.net',password:'password',password_confirmation:'password')
		@user4 = User.create!(name: 'Charlie', email: 'charlie@foo.net',password:'password',password_confirmation:'password')
		@user5 = User.create!(name: 'Earl', email: 'earl@foo.net',password:'password',password_confirmation:'password')
  end

  it "fetches users in alphabetical order" do
    expect(User.in_AtoZ).to eq([@user3,@user2,@user4,@user1,@user5])
  end
end