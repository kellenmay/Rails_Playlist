class CreatePlaylistSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :playlist_songs do |t|
      t.integer :song_id
      t.integer :playlist_id

      t.timestamps
    end
  end
end
