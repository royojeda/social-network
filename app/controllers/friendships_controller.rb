class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params)

    if @friendship.save
      @friend_request = FriendRequest.find_by(sender_id: friendship_params[:friend_id], receiver_id: friendship_params[:user_id])

      @friend_request.destroy

      redirect_to posts_path
    else
      render "users/show"
    end
  end

  def destroy
    @friendship = Friendship.find_by(friendship_params)

    @friendship.destroy

    redirect_to posts_path
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
