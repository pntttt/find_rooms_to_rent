class AddAccommodateToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :accommodate, :string
  end
end
