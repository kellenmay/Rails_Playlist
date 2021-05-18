class PlaylistUser < ApplicationRecord
    belongs_to :playlist
    belongs_to :user
    validates :rating, presence: true
    


end
