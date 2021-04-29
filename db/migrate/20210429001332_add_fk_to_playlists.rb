class AddFkToPlaylists < ActiveRecord::Migration[6.1]
  def change
    add_column :playlists, :playlist_library_id, :integer
  end
end
