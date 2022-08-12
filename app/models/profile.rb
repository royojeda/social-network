class Profile < ApplicationRecord
  require 'digest'

  belongs_to :user

  def gravatar_photo_url
    "https://www.gravatar.com/avatar/#{md5_hash}?d=mp"
  end

  private

  def md5_hash
    Digest::MD5.hexdigest user.email.strip.downcase
  end
end
