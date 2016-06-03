class CreateWaters < ActiveRecord::Migration
  def change
    create_table :waters do |t|
      t.string     :name
      t.text       :description
      t.date       :season_start
      t.date       :season_end
      t.float      :longitude
      t.float      :latitude
      t.timestamps
      t.references :water_type
      t.references :fishery, index: true
    end
  end
end
