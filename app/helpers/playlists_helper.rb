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

def playlist_creator
    Playlist.all.each do |playlist|
        id = playlist.user_id
        user = User.find_by_id(id)
        @email = user.email
    end
    @email
end

def find_user(id)
    User.find_by_id(id)
end


    
end
