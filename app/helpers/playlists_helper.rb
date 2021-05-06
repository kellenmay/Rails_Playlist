module PlaylistsHelper

def all_playlists
    @playlists = Playlist.all
end

def current_playlist
    @playlist = Playlist.find_by_id(params[:id])
end

def current_nested_playlist
    @playlist = Playlist.find_by_id(params[:playlist_id])
end


    
end
