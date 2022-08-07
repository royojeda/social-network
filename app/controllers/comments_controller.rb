class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save
      render @comment.post
    else
      render "users/show"
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.update(comment_params)

    render @comment
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    respond_to { |format| format.turbo_stream }
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
