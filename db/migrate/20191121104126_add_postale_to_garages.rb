class AddPostaleToGarages < ActiveRecord::Migration[5.2]
  def change
    add_column :garages, :postale, :integer
  end
end
