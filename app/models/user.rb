class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :friend_requests, dependent: :destroy, foreign_key: :receiver_id
  has_many :pending_friends, through: :friend_requests, source: :sender

  has_many :posts, inverse_of: :author, foreign_key: :author_id
end
