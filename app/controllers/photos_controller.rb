class PhotosController < ApplicationController
  before_action :load_room, :load_photo, only: [:create, :destroy]
  def create
    return flash[:alert] = t("noti_error") unless params[:images]
    params[:images].each do |img|
      @room.photos.create(image: img)
    end
    @photos = @room.photos
    redirect_back(fallback_location: request.referer, notice: t("noti_saved"))
  end

  def destroy
    @room = @photo.room
    return flash[:alert] = t("noti_error") unless @photo.destroy
    @photos = Photo.where room_id: @room.id
    Cloudinary::Api.delete_resources(@photos, :keep_original => true)
    respond_to :js
  end

  private

  def load_room
    @room = Room.find_by id: params[:room_id]
    return if @room
    flash[:alert] = t("noti_not_found")
    redirect_to new_room_path
  end

  def load_photo
    @photo = Photo.find_by params[:id]
    return flash[:alert] = t("noti_not_found") unless @photo
  end
end
