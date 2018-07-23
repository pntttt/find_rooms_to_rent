class Room < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reservations

  has_many :guest_reviews
end
