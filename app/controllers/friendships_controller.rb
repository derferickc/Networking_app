class FriendshipsController < ApplicationController
  def create
  	Friendship.create(user_id: params[:user_id], friend_id: params[:friend_id], status: params[:status])
  	redirect_to "/users/professional_profile"

  end

  def update
  	Friendship.find(params[:column_id]).update(status:'c')
  	redirect_to "/users/professional_profile"
  end

  def destroy
  	friend = Friendship.find(params[:column_id])
  	friend.destroy
  	redirect_to "/users/professional_profile"
  end
end
