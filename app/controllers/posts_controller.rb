class PostsController < ApplicationController
  def index
    @user = current_user
    @profile = @user.profile
    @friends = @user.friends
    @friend_requests = @user.friend_requests
    @other_users = User.where.not(id: (@user.friends + [@user]).map(&:id)).order('RANDOM()').limit(18)
    shown = [@user] + @user.friends
    @posts = Post.where(author: shown).order(updated_at: :desc)
  end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.turbo_stream
      else
        format.html do
          redirect_to authenticated_root_path
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
