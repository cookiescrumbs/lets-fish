class CreateFish < ActiveRecord::Migration
  def change
    create_table :fish do |t|
      t.string :species
      t.float :weight
      t.references :return, index: true

      t.timestamps
    end
  end
end
