class UsersController < ApplicationController
  def show
    @user = current_user
    @friend_requests = @user.friend_requests
    @other_users = User.where.not(id: @user.id) # .order("random()")
  end
end
