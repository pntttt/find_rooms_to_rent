class RoomsController < ApplicationController
  before_action :load_room, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:show]
  before_action :is_authorised?, except: [:index, :new, :create, :show]

  def show
    unless @room&.active then
      flash[:alert] = t("noti_not_found") 
      redirect_to root_path
    end  
    @photos = @room.photos
  end

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

  def update
    if @room.update room_params
      if room_params[:active] == "true"
        flash[:notice] = t("noti_saved")
        redirect_to room_path
      else
        redirect_back fallback_location: request.referer
      end
      flash[:notice] = t("noti_saved")
    else
      flash[:alert] = t("noti_error")
      redirect_back fallback_location: request.referer
    end
  end

  def photo_upload
    @photos = @room.photos
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
