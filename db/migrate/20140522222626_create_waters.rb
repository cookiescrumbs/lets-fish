class CreateWaters < ActiveRecord::Migration
  def change
    create_table :waters do |t|
      t.string :name
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
