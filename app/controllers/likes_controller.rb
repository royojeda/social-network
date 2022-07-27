class LikesController < ApplicationController
  def create
    @like = Like.new(like_params)

    @like.save

    render "users/show" unless @like.save
  end

  def destroy
    @like = Like.find_by(like_params)

    @like.destroy
  end

  private

  def like_params
    params.require(:like).permit(:liker_id, :likeable_id, :likeable_type)
  end
end
