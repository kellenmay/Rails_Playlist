module SongsHelper

    def display_song
        "#{song.artist}, #{song.title}"
    end

    def alphabetical_by_artist
        @songs.each do |song|   
                song.artist.asc
        end
    end

    def self.search_for_song(query)
        if query
            song_name = Song.find_by(name: query)
            if song_name
                self.where(song_id: song_name)
            else
                @songs = Songs.all
            end
        else
            @songs = Songs.all
        end
    end



end
