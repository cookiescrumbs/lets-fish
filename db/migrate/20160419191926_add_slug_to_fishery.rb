class AddSlugToFishery < ActiveRecord::Migration
  def change
    add_column :fisheries, :slug, :string
    add_index :fisheries, :slug, unique: true
  end
end
