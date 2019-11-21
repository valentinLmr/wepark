class AddFulladdressToGarages < ActiveRecord::Migration[5.2]
  def change
    add_column :garages, :full_address, :string
  end
end
