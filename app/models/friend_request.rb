class FriendRequest < ApplicationRecord
  belongs_to :sender, class_name: "User"
  belongs_to :receiver, class_name: "User"

  validate :cannot_send_friend_request_to_self, :cannot_send_friend_request_to_friend, :inverse_request_uniqueness

  validates :receiver_id, uniqueness: { scope: :sender_id }

  private

  def cannot_send_friend_request_to_self
    errors.add(:receiver_id, "cannot be self") if sender_id == receiver_id
  end

  def cannot_send_friend_request_to_friend
    errors.add(:receiver_id, "cannot be a friend") if receiver.friend_of?(sender)
  end

  def inverse_request_uniqueness
    errors.add(:receiver_id, "has already sent the sender a friend request") if inverse_request_exists?
  end

  def inverse_request_exists?
    FriendRequest.find_by(sender_id: receiver_id, receiver_id: sender_id)
  end
end
