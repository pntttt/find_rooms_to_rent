class SearchController < ApplicationController
  def index
    # STEP 1
    if params[:search_address].present?
      @rooms_address = params[:search_address]
    end

    # STEP 2
    @rooms = Room.by_address(@rooms_address).activated
      .by_room_type(params[:room_type])

    if params[:space].present?
      params[:space].each{ |k, v| @rooms = @rooms.by_space(k, v)}
    end
    if params[:price_min].present? && params[:price_max].present?
      @rooms = @rooms.by_prices(params[:price_min], params[:price_max])
    end

    if params[:utilities].present?
      params[:utilities].each{ |x| @rooms = @rooms.by_utility(x)}
    end

    @arr_rooms = @rooms.to_a

    if (params[:start_date].present? && params[:end_date].present?)
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @rooms.each do |room|
        if !room.available start_date, end_date
          @arrRooms.delete(room)
        end
      end
    end
  end
end
