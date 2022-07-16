class Friendship < ApplicationRecord
  after_create :create_opposite_friendship
  after_destroy :destroy_opposite_friendship

  belongs_to :user
  belongs_to :friend, class_name: "User"

  private

  def create_opposite_friendship
    friend.friends << user unless Friendship.exists?(user: friend, friend: user)
  end

  def destroy_opposite_friendship
    friend.friendships.find_by(friend: user)&.destroy
  end
end
