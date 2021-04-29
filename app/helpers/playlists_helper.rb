module PlaylistsHelper


def current_playlist
    @playlist = Playlist.find_by_id(params[:id])
end

    
end
