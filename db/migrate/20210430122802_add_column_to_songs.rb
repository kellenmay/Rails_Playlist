class AddColumnToSongs < ActiveRecord::Migration[6.1]
  def change
    add_column :songs, :playlist_id, :integer
  end
end
