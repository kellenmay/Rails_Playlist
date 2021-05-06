class PlaylistSongsController < ApplicationController

    def new
        @playlist_song = PlaylistSong.new
        @playlist = Playlist.find_by_id(params[:playlist_id])
    end

    def create
        @playlist = Playlist.find_by_id(params[:playlist_id])
        @playlist_song = @playlist.playlist_songs.build(playlist_song_params)
        binding.pry
       if  @playlist_song.save
        redirect_to playlist_path(@playlist)
       else
        render :new
       end
    end

    def index
    end

    def show
    end
     
    private

    def playlist_song_params
        params.require(:playlist_song).permit(:song_id, :playlist_id)
    end


    
end