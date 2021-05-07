module SongsHelper

    def display_song
        "#{song.artist}, #{song.title}"
    end

    def alphabetical_by_artist
        @songs.each do |song|   
                song.artist.asc
        end
    end

    def song_display
        @playlist.songs.uniq.each do |song|
            song.title
            song.artist
        end
    end


end
