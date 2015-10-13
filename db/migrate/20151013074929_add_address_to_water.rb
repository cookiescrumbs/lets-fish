class AddAddressToWater < ActiveRecord::Migration
  def change
    add_column :waters, :address, :text
  end
end
