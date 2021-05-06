class SongsController < ApplicationController
    include UsersHelper
    include PlaylistsHelper
    include SongsHelper

    def index 
        #if its a nested route, render nested resources data
        if params[:playlist_id]
            @playlist = Playlist.find_by(params[:playlist_id])
            @songs = @playlist.songs
        else
            @songs = Song.search(params[:item]) 
        end
    end 
    
    def new
        if params[:playlist_id]
            @playlist = Playlist.find_by(params[:playlist_id])
            @song = @playlist.songs.build
        else
        @song = Song.new
        end
    end
  
    def create  
        if params[:playlist_id]
            @playlist = current_nested_playlist
            @song = @playlist.songs.build(song_params)
            @playlist.save
        else
             @song = Song.new(song_params)
        end
        if @song.save
            redirect_to playlists_path(@playlist)
        else 
            flash[:errors] = @song.errors.full_messages
            render :new
        end 
    end     
  
    def show 
        @song = Song.find_by_id(params[:id])
    end 
  
    def edit 
        @song = Song.find_by_id(params[:id])
    end 
  
    def update 
        @song = Song.find_by_id(params[:id])
        if @song.update(song_params)
            redirect_to song_path(@song)
        else 
            render :edit
        end 
    end 
  
    def destroy
        @song = Song.find_by_id(params[:id])
        @song.destroy 
        redirect_to songs_path
    end 

    
  
  private 
  
    def song_params
        params.require(:song).permit(:title, :artist, :user_id, :item, :playlist_id)
    end 
  
  end