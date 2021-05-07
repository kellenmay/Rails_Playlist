class SongsController < ApplicationController
    include UsersHelper
    include PlaylistsHelper
    include SongsHelper
    before_action :find_song
    before_action :redirect_if_not_authorized_song, only: [:edit, :update, :destroy]

    def index 
        if params[:playlist_id]
            @playlist = Playlist.find_by(params[:playlist_id])
            @songs = @playlist.songs
        else
            @songs = Song.search(params[:item]) 
        end
    end 
    
    def new
        if params[:playlist_id]
            @playlist = Playlist.find_by_id(params[:playlist_id])
            @song = @playlist.songs.build
        else
            @song = Song.new
        end
    end
  
    def create  
        @song = Song.new(song_params)
        if @song.save
            redirect_to song_path(@song)
        else 
            flash[:errors] = @song.errors.full_messages
            render :new
        end 
    end     
  
    def show 
    end 
  
    def edit 
    end 
  
    def update 
        if @song.update(song_params)
            redirect_to song_path(@song)
        else 
            render :edit
        end 
    end 
  
    def destroy
        @song.destroy 
        redirect_to songs_path
    end 

    
  
  private 
  
    def song_params
        params.require(:song).permit(:title, :artist, :user_id, :item)
    end 

    def find_song
        @song = Song.find_by_id(params[:id])
    end

    def redirect_if_not_authorized_song
        if @song.user_id != current_user.id
            redirect_to song_path(@song)
        end
    end
  
  end