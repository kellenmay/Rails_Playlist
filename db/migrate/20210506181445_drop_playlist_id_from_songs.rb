class DropPlaylistIdFromSongs < ActiveRecord::Migration[6.1]
  def change
    remove_column(:songs, :playlist_id)
  end
end
