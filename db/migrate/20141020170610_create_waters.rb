class CreateWaters < ActiveRecord::Migration
  def change
    create_table :waters do |t|
      t.string :name
      t.string :lat_lng
      t.text :description
      t.string :prices
      t.date :season_start
      t.date :season_end

      t.timestamps

      t.references :fisheries, index: true
    end
  end
end
