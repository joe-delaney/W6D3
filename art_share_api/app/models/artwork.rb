# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord

  belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :User

  has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy

  has_many :shared_viewers,
    through: :artwork_shares,
    source: :viewer
  
  has_many :comments,
    foreign_key: :artwork_id,
    class_name: :Comment,
    dependent: :destroy
end
