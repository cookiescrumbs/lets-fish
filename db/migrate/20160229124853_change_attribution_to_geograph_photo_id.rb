class ChangeAttributionToGeographPhotoId < ActiveRecord::Migration
  def change
    rename_column :images, :attribution, :geograph_photo_id
  end
end
