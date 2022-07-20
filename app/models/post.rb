class Post < ApplicationRecord
  belongs_to :author, class_name: "User"

  has_many :comments

  validates :content, presence: true
end
