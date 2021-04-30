class UsersController < ApplicationController
  include UsersHelper
  include SongsHelper
  include PlaylistsHelper
  include ApplicationHelper

  def index 
      @users = User.all
  end 
  
  def new # render a signup form
    if !logged_in?
        @user = User.new
    else 
        redirect_to root_path
    end 
end

  def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else 
          render :new
      end 
  end 

  def show 
    find_user
    # binding.pry
  end 

  def edit 
    find_user
  end 

  def update 
    find_user
      if @user.update(user_params)
          redirect_to user_path(@user)
      else 
          render :edit
      end 
  end 

  def destroy 
    find_user
      @user.destroy 
      redirect_to users_path
  end 

private 

  def user_params
      params.require(:user).permit(:email, :password)
  end 

  def find_user
    @user = User.find_by_id(params[:id])
  end


end