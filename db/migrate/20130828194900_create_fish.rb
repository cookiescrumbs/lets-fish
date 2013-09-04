class CreateFish < ActiveRecord::Migration
  def change
    create_table :fish do |t|
      t.string :species
      t.string :weight
      t.string :fly
      t.string :location

      t.timestamps
    end
  end
end
