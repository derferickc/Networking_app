class UsersController < ApplicationController

  def index
    @allusers = User.all
    # puts @allusers
    # @me = User.find(session[:user_id])
    # puts @me
    # @users = @allusers - @me
    # @users = User.where('id!=?', session[:user_id]).where('id!=?', 2)
  end

  def create
    user = User.new( name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], description: params[:description] )
  	user.save
  	if user.save
  		flash[:success] = "Successfully added new user"
  		redirect_to '/users/main'
    else
  		flash[:errors] = user.errors.full_messages
  		redirect_to '/users/main'
  	end
  end

  def professional_profile
  	@myprofile = User.find(session[:user_id])
  	@friends = Friendship.where(status: 'b', user_id: session[:user_id])
  	@myfriends = Friendship.where(status: 'c', user_id: session[:user_id])
  end

  def show
	@user = User.find(params[:id])
  end
end
