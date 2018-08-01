class PagesController < ApplicationController
  def home
    @rooms = Room.activated.limit Settings.room.samples.LIMIT
  end
end
