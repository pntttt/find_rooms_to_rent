class AddFieldToRoom < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :active, :boolean
  end
end
