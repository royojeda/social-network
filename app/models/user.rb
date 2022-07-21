class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true, length: { in: 4..12 }

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  has_many :friend_requests, dependent: :destroy, foreign_key: :receiver_id
  has_many :pending_friends, through: :friend_requests, source: :sender

  has_many :posts, inverse_of: :author, foreign_key: :author_id

  has_many :comments, inverse_of: :commenter, foreign_key: :commenter_id

  has_many :likes, dependent: :destroy,
                   foreign_key: :liker_id
  has_many :liked_posts, through: :likes,
                         source: :likeable,
                         source_type: "Post"
  has_many :liked_comments, through: :likes,
                            source: :likeable,
                            source_type: "Comment"
end
