class ChangeAmountCentsToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :amount_cents, :float
  end
end
