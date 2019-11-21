class ChangePriceToGarages < ActiveRecord::Migration[5.2]
  def change
    remove_column :garages, :price
    add_monetize :garages, :price, currency: { present: false }
  end
end
