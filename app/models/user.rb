class User < ApplicationRecord
    has_secure_password
    validates :email, presence: true, :uniqueness => { :case_sensitive => false }
    has_many :playlist_users
    has_many :playlists, through: :playlist_users
    validates :password, length: { minimum: 6 }, if: :password_digest_changed?
    validates :password, confirmation: { case_sensitive: true }



    end