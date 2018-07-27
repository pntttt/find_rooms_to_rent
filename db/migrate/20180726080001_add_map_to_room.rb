class AddMapToRoom < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :latitude, :float, null: false
    add_column :rooms, :longitude, :float, null: false
  end
end
