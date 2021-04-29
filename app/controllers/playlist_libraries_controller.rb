class PlaylistLibrariesController < ApplicationController
    include UsersHelper
    include SongsHelper
    include PlaylistsHelper


    def index
        @playlist_library = Playlist.all
    end


end
