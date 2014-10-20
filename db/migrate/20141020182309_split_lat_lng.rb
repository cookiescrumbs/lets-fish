class SplitLatLng < ActiveRecord::Migration
  def change
    change_table :waters do |t|
      t.remove :lng_lat
      t.column :longitude, :float
      t.column :latitude, :float
    end
  end
end
