class CreatePlaylistLibraries < ActiveRecord::Migration[6.1]
  def change
    create_table :playlist_libraries do |t|
      t.string :show

      t.timestamps
    end
  end
end
