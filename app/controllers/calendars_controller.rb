class CalendarsController < ApplicationController
  before_action :authenticate_user!

  def index
    @rooms = current_user.rooms
    params[:room_id] ||= @rooms[0] ? @rooms[0].id : nil
    if params[:room_id]
      @room = Room.find_by id: params[:room_id]
      start_date = Date.parse Date.current.to_s

      first_of_month = (start_date - 1.months).beginning_of_month
      end_of_month = (start_date + 1.months).end_of_month

      @events = @room.reservations.calendar_events first_of_month, end_of_month
      @events.each{ |e| e.image = avatar_url(e) }
    else
      @room = nil
      @events = []
    end
  end
end
