class PlaylistsController < ApplicationController
    include UsersHelper
    include SongsHelper
    include PlaylistsHelper

    def index 
        all_playlists
    end 
    
    def new
        @playlist = Playlist.new
    end
  
    def create
        @playlist = Playlist.new(name: playlist_params[:name])
        @playlist.creator_id = current_user.id
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
        current_playlist
        @user = PlaylistUser.find_by_id(params[:user_id])
        
    end 
  
    def edit 
        get_playlist
        redirect_if_not_authorized
        current_playlist
    end 


  
    def update 
        get_playlist
        redirect_if_not_authorized
        current_playlist
        if @playlist.update(playlist_params)
            redirect_to playlist_path(@playlist)
        else 
            render :edit
        end 
    end 
  
    def destroy 
        get_playlist
        redirect_if_not_authorized
        current_playlist
        @playlist.destroy 
        redirect_to playlists_path
    end 
  
  private 
  
    def playlist_params
        params.require(:playlist).permit(:name, :creator_id, song_ids: [])
    end 

    def get_playlist
        @playlist = Playlist.find_by_id(params[:id])
    end

    def redirect_if_not_authorized
        if @playlist.creator_id != current_user.id
            redirect_to playlists_path
        end
    end
  
  end