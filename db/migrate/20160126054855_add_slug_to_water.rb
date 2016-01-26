class AddSlugToWater < ActiveRecord::Migration
  def change
    add_column :waters, :slug, :string
    add_index :waters, :slug, unique: true
  end
end
