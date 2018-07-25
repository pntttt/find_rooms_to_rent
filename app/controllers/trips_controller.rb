class TripsController < ReservationsController
  def index
    @trips = current_user.reservations.most_recent
  end
end
