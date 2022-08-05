class FriendRequestsController < ApplicationController
  def create
    @friend_request = FriendRequest.new(friend_request_params)

    if @friend_request.save
      redirect_to user_path(current_user)
    else
      render "users/show"
    end
  end

  def destroy
    @friend_request = FriendRequest.find(params[:id])

    @friend_request.destroy

    respond_to { |format| format.turbo_stream }
  end

  private

  def friend_request_params
    params.require(:friend_request).permit(:sender_id, :receiver_id)
  end
end
