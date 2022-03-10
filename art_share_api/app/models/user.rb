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

  has_many :likes, foreign_key: :liker_id

  # polymorphic association
  has_many :liked_artworks,
    through: :likes,
    source: :likable,
    source_type: :Artwork

  has_many :liked_comments,
    through: :likes,
    source: :likable,
    source_type: :Comment

  has_many :collections, 
    foreign_key: :collector_id,
    class_name: :Collection

  has_many :all_artworks_in_collections,
    through: :collections,
    source: :artworks

  def collection_names
    collections.select('collections.name').pluck('collections.name').uniq
  end

  def favorite_artworks
    artworks.where('artworks.favorite = True')
  end

  def favorite_shared_artworks
    shared_artworks.where('artwork_shares.favorite = True')
  end

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

  def artworks_in_collection(collection_name)
    all_artworks_in_collections.where("collections.name = ?", collection_name)
  end

end
