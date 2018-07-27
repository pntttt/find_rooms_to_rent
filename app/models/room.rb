class Room < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :guest_reviews

  delegate :name, :to => :user, :allow_nil => true, :prefix => true

  validates :home_type, presence: true
  validates :room_type, presence: true
  validates :accommodate, presence: true
  validates :bed_room, presence: true
  validates :bath_room, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def cover_photo size
    return photos[0].image.url size unless photos.empty?
    "blank.jpg"
  end
end
