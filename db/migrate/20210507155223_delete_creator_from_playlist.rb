class DeleteCreatorFromPlaylist < ActiveRecord::Migration[6.1]
  def change
    remove_column(:playlists, :creator_id)
  end
end
