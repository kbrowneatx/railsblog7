class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id, :comments_attributes
  validates :title, presence: true, length: { maximum: 55 }
  validates :content, presence: true
  
  scope :recent, order('created_at DESC').limit(3)
  
  belongs_to :user
  has_many :comments, :dependent => :destroy
  accepts_nested_attributes_for :comments
	
	def self.search(search)
		if search
			where('title LIKE ?', "%#{search}%")
		else
			scoped
		end
	end
end
