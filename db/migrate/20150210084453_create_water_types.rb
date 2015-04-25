class CreateWaterTypes < ActiveRecord::Migration
  def change
    create_table :water_types do |t|
      t.string :category
      t.timestamps
    end
  end
end
