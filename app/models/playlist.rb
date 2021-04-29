class Playlist < ApplicationRecord
    belongs_to :user
    belongs_to :playlist_library
    has_many :songs
end