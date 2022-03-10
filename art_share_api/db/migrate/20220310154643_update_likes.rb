class UpdateLikes < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :liker_id
  end
end
