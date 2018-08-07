class Reservation < ApplicationRecord
  scope :most_recent, ->{order start_date: :asc}
  scope :preload_list, ->(date){where "start_date >= ? or end_date >= ?", date, date}
  scope :conflict_list, ->(start_date, end_date){where "? < start_date AND end_date < ?", start_date, end_date}
  scope :check_guest_reservation, ->(reservation_id, room_id){where id: reservation_id, room_id: room_id}
  scope :check_host_reservation, ->(reservation_id, room_id, guest_id){where id: reservation_id, room_id: room_id, user_id: guest_id}
  scope :calendar_events, ->(start_date, end_date){joins(:user)
                              .select("reservations.*, users.name, users.image")
                              .where("start_date BETWEEN ? AND ?", start_date, end_date)}

  belongs_to :user
  belongs_to :room
end
