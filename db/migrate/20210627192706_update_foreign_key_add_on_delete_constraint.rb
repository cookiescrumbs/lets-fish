class UpdateForeignKeyAddOnDeleteConstraint < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :posts, :trips
    add_foreign_key :posts, :trips, on_delete: :cascade
  end
end
