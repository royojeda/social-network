class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)

    if @like.save
      redirect_to user_path(current_user)
    else
      render "users/show"
    end
  end

  def destroy
    @like = Like.find_by(like_params)

    @like.destroy

    redirect_to user_path(current_user)
  end

  private

  def like_params
    params.require(:like).permit(:liker_id, :likeable_id, :likeable_type)
  end
end
