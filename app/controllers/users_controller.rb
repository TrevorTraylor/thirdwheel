class UsersController < ApplicationController
  before_action :set_auth
  def index

  end
  def new
    render 'new'
  end

  def show
    if session[:user_id]
      @user=User.find(params[:id])
      @friend= @user.friendships.all
    end
    if params[:search]
    else
      @users = User.all
    end
  end

  def edit
  end


  def create
  	user = User.create(user_params)
  	if user.save
  		redirect_to '/'
  	else
  		flash[:errors]= user.errors.full_messages
  		redirect_to '/users/new'
  	end
  end

  def fcreate
    @user = User.find(session[:user_id])
    @friendship = @user.friendships.new(friend: User.find(params[:friend_id]))
    @inverse_friendship= User.find(params[:friend_id]).friendships.new(friend: User.find(@user))
    if @friendship.save && @inverse_friendship.save
      flash[:notice] = "Added friend."
      redirect_to (:back)
    else
      flash[:error] = "Unable to add friend."
      redirect_to (:back)
    end
  end
  def fdestroy
    @user = User.find(session[:user_id])
    @friendship = @user.friendships.find_by(friend: params[:friend_id])
    @inverse_friendship = User.find(params[:friend_id]).friendships.find_by(friend: User.find(@user))
    if @friendship.destroy && @inverse_friendship.destroy
      flash[:notice] = "Removed friendship."
      redirect_to (:back)
    end
  end
  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  def set_auth
    @auth = session[:omniauth] if session[:omniauth]
  end
end
