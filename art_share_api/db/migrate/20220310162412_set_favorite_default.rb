class SetFavoriteDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :artworks, :favorite, false
    change_column_default :artwork_shares, :favorite, false

  end
end
