class AddAnnotationToWater < ActiveRecord::Migration
  def change
    add_column :waters, :annotation, :json, null: false, default: '{}'
  end
end
