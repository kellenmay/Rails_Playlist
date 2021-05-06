class AddRatingToPlaylistSongs < ActiveRecord::Migration[6.1]
  def change
    add_column :playlist_songs, :rating, :string
  end
end
