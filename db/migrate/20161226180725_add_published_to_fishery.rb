class AddPublishedToFishery < ActiveRecord::Migration
  def change
    add_column :fisheries, :published, :boolean
  end
end
