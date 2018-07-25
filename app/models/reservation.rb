class Reservation < ApplicationRecord
  scope :most_recent, -> {order start_date: :asc}
  belongs_to :user
  belongs_to :room
end
