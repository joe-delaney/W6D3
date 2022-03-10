class Like < ApplicationRecord

  validates :liker_id, presence: true

  belongs_to :likable, polymorphic: true
  
  belongs_to :user, foreign_key: :liker_id
end