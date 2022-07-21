class Comment < ApplicationRecord
  belongs_to :commenter, class_name: "User"
  belongs_to :post

  validates :body, presence: true

  has_many :likes, as: :likeable, dependent: :destroy
  has_many :likers, through: :likes
end
