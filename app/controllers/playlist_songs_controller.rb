class PlaylistSongsController < ApplicationController
    before_action :find_playlist

    def new
        @playlist_song = PlaylistSong.new
        @songs = Song.all
    end

    def create
        redirect_if_not_authorized
        @playlist_song = @playlist.playlist_songs.build(playlist_song_params)
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

    def find_playlist
        @playlist = Playlist.find_by_id(params[:playlist_id])
    end

    private

    def redirect_if_not_authorized
        if @playlist.user_id != current_user.id
            redirect_to playlists_path
        end
    end

    
end