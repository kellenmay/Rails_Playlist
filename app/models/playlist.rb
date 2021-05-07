class Playlist < ApplicationRecord
    belongs_to :user
    has_many :playlist_songs
    has_many :playlist_users
    has_many :playlists, through: :playlist_users
    has_many :songs, through: :playlist_songs
   

    accepts_nested_attributes_for :playlist_songs
end