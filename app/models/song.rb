class Song < ApplicationRecord
    has_many :playlist_songs
    has_many :playlists, through: :playlist_songs
    validates :title, :artist, presence: true
    scope :top_song, -> {joins(:playlist_songs).group("playlist_songs.song_id").order("count(playlist_songs.song_id) desc").limit(1)}
    
    
    def self.search(item)
        if item
            self.where('title LIKE ?', "%#{item}%")
        else
            @songs = Song.all
        end
    end


        

end