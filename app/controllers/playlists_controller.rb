class PlaylistsController < ApplicationController
    include UsersHelper
    include SongsHelper
    include PlaylistsHelper

    def index 
        @playlists = Playlist.all
    end 
    
    def new
        @playlist = Playlist.new
    end
  
    def create
        @playlist = Playlist.new(name: playlist_params[:name])
        # binding.pry
        @playlist.user_id = current_user.id
        @playlist.playlist_library_id = PlaylistLibrary.first.id

        if @playlist.save
            playlist_params[:song_ids].each do |song|
                # binding.pry
                if song != ""
                 PlaylistSong.create(playlist_id: @playlist.id, song_id: song)
                end
            end

            redirect_to playlist_path(@playlist)
        
        else 
            # binding.pry
            render :new
        end 
    end 

    def show 
        current_playlist
        @new_song = @playlist.song_ids.build
    end 
  
    def edit 
        current_playlist
    end 
  
    def update 
        current_playlist
        if @playlist.update(playlist_params)
            redirect_to playlist_path(@playlist)
        else 
            render :edit
        end 
    end 
  
    def destroy 
        current_playlist
        @playlist.destroy 
        redirect_to playlists_path
    end 
  
  private 
  
    def playlist_params
        params.require(:playlist).permit(:name, song_ids: [])
        # params.require(:playlist).permit(:name)
    end 
  
  end