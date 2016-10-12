class AddDescriptionToFishery < ActiveRecord::Migration
  def change
    add_column :fisheries, :description, :text
  end
end
