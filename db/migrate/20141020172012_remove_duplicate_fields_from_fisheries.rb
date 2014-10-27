class RemoveDuplicateFieldsFromFisheries < ActiveRecord::Migration
  def change
    
    change_table :fisheries do |t|
      t.remove :description
      t.remove :lat_lng
      t.remove :prices
      t.remove :records
      t.remove :season
      t.remove :facilities
    end
  end
end
