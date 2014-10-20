class SplitLatLng < ActiveRecord::Migration
  def change
    change_table :waters do |t|
      t.column :longitude, :float
      t.column :latitude, :float
    end
  end
end
