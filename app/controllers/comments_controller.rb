class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      render @comment.post
    else
      render "users/show"
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
