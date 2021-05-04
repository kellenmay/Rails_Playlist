module SongsHelper

    def display_song
        "#{song.artist}, #{song.title}"
    end

    def alphabetical_by_artist
        @songs.each do |song|   
                song.artist.asc
        end
    end




end
