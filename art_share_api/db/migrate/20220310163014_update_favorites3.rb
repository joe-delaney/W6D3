class UpdateFavorites3 < ActiveRecord::Migration[5.2]
  def change
    change_column_null :artworks, :favorite, false
    change_column_null :artwork_shares, :favorite, false
  end
end
