class UpdateLikes2 < ActiveRecord::Migration[5.2]
  def change
    rename_column :likes, :artwork_id, :liker_id
  end
end
