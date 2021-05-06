class CreatePlaylistUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :playlist_users do |t|
      t.integer :user_id
      t.integer :playlist_id
      t.integer :rating

      t.timestamps
    end
  end
end
