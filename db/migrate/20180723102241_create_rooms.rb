class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :home_type
      t.string :room_type
      t.integer :bed_room
      t.integer :bath_room
      t.string :name
      t.boolean :is_tv
      t.boolean :is_kitchen
      t.boolean :is_air
      t.boolean :is_heating
      t.boolean :is_internet
      t.integer :price
      t.float :lat
      t.float :lon
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
