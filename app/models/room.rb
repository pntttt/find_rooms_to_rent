class Room < ApplicationRecord
  belongs_to :user
  has_many :photos
  has_many :reservations
  has_many :guest_reviews

  scope :activated, ->{where(active: true)}
  scope :by_address, -> (addr){where('address LIKE ?', "%#{addr}%")}
  scope :by_prices, ->(min_p = 0, max_p = 1000){where(price: min_p..max_p)}
  scope :by_room_type, ->(types = nil){where(room_type: types) unless types == nil}
  scope :by_space, ->(key, value){where("#{key}": value) unless value.empty?}
  scope :by_utility, ->(utility){where("#{utility}": true)}
  delegate :name, to: :user, allow_nil: true, prefix: true

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

  def average_rating
    guest_reviews.count == 0 ? 0 : guest_reviews.average(:star).round(2).to_i
  end

  def available? start_date, end_date
    reservation.where(
      "(? <= start_date AND start_date <= ?)
      OR (? <= end_date AND end_date <= ?)
      OR (start_date < ? AND ? < end_date)",
      start_date, end_date,
      start_date, end_date,
      start_date, end_date
    ).limit(1).length == 0
  end
end
