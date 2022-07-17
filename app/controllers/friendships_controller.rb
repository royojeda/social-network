class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new(friendship_params)

    if @friendship.save
      @friend_request = FriendRequest.find_by(sender_id: friendship_params[:friend_id], receiver_id: friendship_params[:user_id])

      @friend_request.destroy

      redirect_to user_path(current_user)
    else
      render "users/show"
    end
  end

  def destroy
    @friendship = Friendship.find_by(friendship_params)

    puts "---------------------------------------------------------------------"
    p @friendship

    @friendship.destroy

    redirect_to user_path(current_user)
  end

  private

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
