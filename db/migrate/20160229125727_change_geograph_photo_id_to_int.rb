class ChangeGeographPhotoIdToInt < ActiveRecord::Migration
  def change
    change_column :images, :geograph_photo_id, 'integer USING CAST(geograph_photo_id AS integer)'
  end
end
