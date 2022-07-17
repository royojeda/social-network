class UsersController < ApplicationController
  def show
    @user = current_user
    @friend_requests = @user.friend_requests
  end
end
