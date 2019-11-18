class CreateGarages < ActiveRecord::Migration[5.2]
  def change
    create_table :garages do |t|
      t.integer :capacity
      t.integer :price
      t.text :description
      t.string :location
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
