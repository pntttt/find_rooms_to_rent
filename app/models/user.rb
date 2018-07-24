class User < ApplicationRecord
  has_many :rooms
  has_many :reservations

  has_many :guest_reviews, class_name: GuestReview.name, foreign_key: :guest_id
  has_many :host_reviews, class_name: HostReview.name, foreign_key: :host_id
end
