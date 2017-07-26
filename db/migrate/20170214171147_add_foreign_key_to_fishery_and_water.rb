class AddForeignKeyToFisheryAndWater < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :waters, :fisheries, on_delete: :cascade
  end
end
