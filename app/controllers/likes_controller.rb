class LikesController < ApplicationController
  def create
    @like = current_user.likes.new(like_params)

    @like.save

    if @like.save
      render @like.likeable
    else
      render "users/show"
    end
  end

  def destroy
    @like = current_user.likes.find(params[:id])

    @like.destroy

    render @like.likeable
  end

  private

  def like_params
    params.require(:like).permit(:likeable_id, :likeable_type)
  end
end
