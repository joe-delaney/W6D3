class Collection < ApplicationRecord
  validates :name, :collector_id, :artwork_id, presence:true
  # validate :duplicate_entry

  belongs_to :collector, 
    foreign_key: :collector_id,
    class_name: :User

  belongs_to :artworks, 
    foreign_key: :artwork_id,
    class_name: :Artwork


  # def duplicate_entry
  #   debugger
  #   if Collection.where("collections.artwork_id = #{self.artwork_id} AND collections.name = #{self.name} AND collections.collector_id = #{self.collector_id}")
  #     errors[:artwork_id] << "is already in this collection."
  #   end
  # end
end