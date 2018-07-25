class AddAddressAndSummaryToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :summary, :text
    add_column :rooms, :address, :string
  end
end
