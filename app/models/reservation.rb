class Reservation < ApplicationRecord
  scope :most_recent, -> {order start_date: :asc}
  scope :preload_list, -> (date){where "start_date >= ? or end_date >= ?", date, date}
  scope :conflict_list, -> (start_date, end_date){where "? < start_date AND end_date < ?", start_date, end_date}
  belongs_to :user
  belongs_to :room
end
