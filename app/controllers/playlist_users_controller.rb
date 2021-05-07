class PlaylistUsersController < ApplicationController
  include UsersHelper
  include SongsHelper
  include PlaylistsHelper
  include ApplicationHelper
  before_action :find_playlist


  def new
    @playlist_user = PlaylistUser.new
    @playlist = Playlist.find_by_id(params[:playlist_id])
  end

  def create
    @playlist = Playlist.find_by_id(params[:playlist_id])
    @playlist_user = @playlist.playlist_users.build(playlist_user_params)
    if @playlist_user.save
      redirect_to playlist_path(@playlist)
    else
      render :new
    end
  end
  
  def edit
  end

  def update
  end

  def destroy
  end


  private 

  def playlist_user_params
      params.require(:playlist_user).permit(:rating, :user_id, :playlist_id)
  end

  
  def find_playlist
    @playlist = Playlist.find_by_id(params[:playlist_id])
end

end
