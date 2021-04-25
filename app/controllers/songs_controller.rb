class SongsController < ApplicationController
    
    def index 
        @songs = Song.all
    end 
    
    def new
        @song = Song.new
    end
  
    def create
        @song = Song.new(song_params)
        if @song.save
            redirect_to song_path(@song)
        else 
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
        params.require(:song).permit(:name)
    end 
  
  end