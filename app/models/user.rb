class User < ApplicationRecord
    has_secure_password
    validates :email, :uniqueness => { :case_sensitive => false }
    # .authenticate
    # reader and writers for the password
    # validates the presence of password
    has_many :playlists
    has_many :songs, through: :playlists

    end