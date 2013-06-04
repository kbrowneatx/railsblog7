class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me, :role, :postanonymous

  validates :name, presence: true, uniqueness: true, length: { maximum: 40 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :role, :inclusion => { :in => %w(author reader), :message => "must be author (requires admin approval) or reader" }
  
  scope :in_AtoZ, order('name ASC')
  scope :avidreader, select('users.id, count(comments.id) AS comment_count').
						joins(:comments).
						group('users.id').
						order('comment_count DESC').
						limit(4)

  has_many :posts
  has_many :comments
end
