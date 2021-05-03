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

  def profile
    redirect_to user_path(current_user)
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



def create
  if params[:playlist_id]
      @playlist = Playlist.find_by(params[:playlist_id])
      @songs = @playlist.songs.build(song_params)
  else
       @song = Song.new(song_params)
  end
  if @song.save
      redirect_to song_path(@song)
  else 
      render :new
  end 
end 