class AddColumnToGarages < ActiveRecord::Migration[5.2]
  def change
    add_column :garages, :city, :string
  end
end
