class RemoveLatLngFromWaters < ActiveRecord::Migration
  def change
    remove_column :waters, :lat_lng, :string
  end
end
