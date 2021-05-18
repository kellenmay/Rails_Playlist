class PlaylistSong < ApplicationRecord
    belongs_to :song
    belongs_to :playlist
    # has_many :users

    # validate :playlist_rating :inclusion => 1..10
    # def playlist_rating
    #     if rating > 0 && rating < 5
    #         @rating
    #     end
    # end

end
