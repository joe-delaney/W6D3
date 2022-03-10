class UpdateCollections < ActiveRecord::Migration[5.2]
  def change
    add_index :collections, [:artwork_id, :name, :collector_id], unique:true
  end
end
