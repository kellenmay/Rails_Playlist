class AddCreatorToPlaylist < ActiveRecord::Migration[6.1]
  def change
    add_column :playlists, :creator_id, :integer
  end
end
