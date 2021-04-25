class Playlist < ApplicationRecord
    has_many :users
    has_many :playlists
end