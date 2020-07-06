class RemovePlaceIdFromFisheries< ActiveRecord::Migration[5.0]
  def change
    remove_column :fisheries, :place_id, :data_type, {}
  end
end
