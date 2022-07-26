class UsersController < ApplicationController
  def show
    @user = current_user
    @profile = @user.profile
    @friend_requests = @user.friend_requests
    @other_users = User.where.not(id: @user.id) # .order("random()")
    # @posts = Post.where(author: current_user)
    @posts = Post.all.order('posts.created_at DESC')
  end
end
