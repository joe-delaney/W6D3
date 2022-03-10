class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :liker_id, null: false
      t.integer :artwork_id, null: false
      t.references :likable, polymorphic: true
      t.timestamps
    end

    add_index :likes, :liker_id
    add_index :likes, :artwork_id
  end
end
