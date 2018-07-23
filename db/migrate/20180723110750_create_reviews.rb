class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :star
      t.references :room
      t.references :reservation
      t.references :guest
      t.references :host
      t.string :type

      t.timestamps
    end
  end
end
