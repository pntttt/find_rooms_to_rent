class RoomsController < ApplicationController
  before_action :load_room, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorised?, except: [:index, :new, :create]

  def new
    @room = current_user.rooms.build
  end

  def create
    @room = current_user.rooms.build room_params
    if @room.save
      redirect_to listing_room_path(@room), notice: t("noti_saved")
    else  
      flash[:alert] = t("noti_error")
      render :new
    end  
  end

  private
  def load_room
    @room = Room.find_by id: params[:id]
    return if @room
    flash[:alert] = t("noti_not_found")
    redirect_to new_room_path
  end

  def room_params
    params.require(:room).permit(
      :home_type, :room_type, :accommodate, :bed_room, :bath_room, :name,
      :summary, :address, :is_tv, :is_kitchen, :is_air, :is_heating,
      :is_internet, :price, :active
    )
  end

  def is_authorised?
    redirect_to root_path, alert: t("noti_permission") unless
    current_user.id == @room.user_id
  end
end
