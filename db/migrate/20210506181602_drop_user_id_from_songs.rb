class DropUserIdFromSongs < ActiveRecord::Migration[6.1]
  def change
    remove_column(:songs, :user_id)
  end
end
