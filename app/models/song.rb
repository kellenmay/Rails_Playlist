class Song < ApplicationRecord
    has_many :playlist_songs
    has_many :playlists, through: :playlist_songs
    validates :title, presence: true

    
    def self.search(item)
        if item
            self.where('title LIKE ?', "%#{item}%")
        else
            @songs = Song.all
        end
    end



end