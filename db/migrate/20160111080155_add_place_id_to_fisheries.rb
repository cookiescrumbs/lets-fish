class AddPlaceIdToFisheries < ActiveRecord::Migration
  def change
    add_column :fisheries, :place_id, :string
  end
end
