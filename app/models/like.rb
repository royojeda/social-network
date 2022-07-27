class Like < ApplicationRecord
  validates :liker_id, uniqueness: { scope: [:likeable_id, :likeable_type] }

  belongs_to :liker, class_name: "User"
  belongs_to :likeable, polymorphic: true
end
