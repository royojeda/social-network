class PostsController < ApplicationController
  def index
    @user = current_user
    @profile = @user.profile
    @friend_requests = @user.friend_requests
    @other_users = User.where.not(id: @user.id) # .order("random()")
    # @posts = Post.where(author: current_user)
    @posts = Post.all.order('posts.created_at DESC')
  end

  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to user_path(current_user)
    else
      render "users/show"
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
