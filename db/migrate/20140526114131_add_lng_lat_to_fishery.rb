class AddLngLatToFishery < ActiveRecord::Migration
  def change
    add_column :fisheries, :lng, :float
    add_column :fisheries, :lat, :float
  end
end
