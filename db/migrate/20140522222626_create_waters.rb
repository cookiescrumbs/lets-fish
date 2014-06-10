class CreateWaters < ActiveRecord::Migration
  def change
    create_table :waters do |t|
      t.string :name
      t.float :lng
      t.float :lat
    end
    add_reference :waters, :fishery, index: true
  end
end