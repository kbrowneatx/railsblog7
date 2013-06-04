class Comment < ActiveRecord::Base
  attr_accessible :content, :user_id, :post_id
  validates :user_id, presence: true
  
  belongs_to :user
  belongs_to :post
end
