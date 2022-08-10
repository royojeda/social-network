class FriendRequestsController < ApplicationController
  def create
    @friend_request = FriendRequest.new(friend_request_params)
    @friend_request.sender = current_user

    respond_to do |format|
      if @friend_request.save
        format.turbo_stream
      else
        format.html { redirect_to posts_path }
      end
    end
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])

    @friend_request.destroy

    respond_to { |format| format.turbo_stream }
  end

  private

  def friend_request_params
    params.require(:friend_request).permit(:receiver_id)
  end
end
