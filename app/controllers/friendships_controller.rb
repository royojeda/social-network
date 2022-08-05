class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.new(friendship_params)

    respond_to do |format|
      if @friendship.save
        @friend_request = current_user.friend_requests.find_by(sender_id: friendship_params[:friend_id])

        @friend_request.destroy

        format.turbo_stream
      end
    end
  end

  def destroy
    @friendship = Friendship.find(params[:id])

    @friendship.destroy

    redirect_to posts_path
  end

  private

  def friendship_params
    params.require(:friendship).permit(:friend_id)
  end
end
