# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord 
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork,
    dependent: :destroy
  
  has_many :artwork_shares,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare,
    dependent: :destroy
  
  has_many :shared_artworks,
    through: :artwork_shares,
    source: :artwork

  has_many :comments,
    foreign_key: :user_id,
    class_name: :Comment,
    dependent: :destroy

    def search(query)
      return "Narrow your search, please" if query.length < 2
      user = User.find_by("users.username ILIKE '%#{query}' OR
      users.username ILIKE '%#{query}%' OR
      users.username ILIKE '#{query}%'")

      user.nil? ? "User not found" : user
    end

    def all_artworks
      self.artworks + self.shared_artworks
    end

end
