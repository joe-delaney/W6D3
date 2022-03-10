class AddFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :artwork_shares, :favorite, :boolean
    add_column :artworks, :favorite, :boolean
  end
end
