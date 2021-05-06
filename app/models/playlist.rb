class Playlist < ApplicationRecord
    has_many :playlist_songs
    has_many :playlist_users
    has_many :playlists, through: :playlist_users
    has_many :songs, through: :playlist_songs
    belongs_to :creator, :class_name => "User", :foreign_key => "creator_id"


    accepts_nested_attributes_for :playlist_songs
end