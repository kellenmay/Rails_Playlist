class PlaylistsController < ApplicationController
    include UsersHelper
    include SongsHelper
    include PlaylistsHelper
    before_action :get_playlist 
    before_action :redirect_if_not_authorized, only: [:edit, :update, :destroy]

    def index 
        @playlists = Playlist.all
    end 
    
    def new
        @playlist = Playlist.new
    end
  
    def create
        @playlist = Playlist.new(playlist_params)
        @playlist.user_id = current_user.id
        
        if @playlist.save
            playlist_params[:song_ids].each do |song|
                if song != ""
                 PlaylistSong.create(playlist_id: @playlist.id, song_id: song)
                end
            end
            redirect_to playlist_path(@playlist)
        else 
            render :new
        end 
    end 

    def show 
        @user = PlaylistUser.find_by_id(params[:user_id])

    end 
  
    def edit
        redirect_if_not_authorized
    end 


  
    def update 
        redirect_if_not_authorized
        if @playlist.update(playlist_params)
            redirect_to playlist_path(@playlist)
        else 
            render :edit
        end 
    end 
  
    def destroy 
        redirect_if_not_authorized
        @playlist.destroy 
        redirect_to playlists_path
    end 
  
  private 
  
    def playlist_params
        params.require(:playlist).permit(:name, :user_id, song_ids: [])
    end 

    def get_playlist
        @playlist = Playlist.find_by_id(params[:id])
    end

    def redirect_if_not_authorized
        if @playlist.user_id != current_user.id
            redirect_to playlists_path
        end
    end
  
  end