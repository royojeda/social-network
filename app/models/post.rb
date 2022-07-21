class Post < ApplicationRecord
  belongs_to :author, class_name: "User"

  has_many :comments

  validates :content, presence: true

  has_many :likes, as: :likeable, dependent: :destroy
  has_many :likers, through: :likes
end
