class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)

    redirect_to authenticated_root_path if @comment.save
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
