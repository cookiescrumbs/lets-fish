class AddMapZoomLevelToFishery < ActiveRecord::Migration
  def change
    add_column :fisheries, :map_zoom_level, :int
  end
end
