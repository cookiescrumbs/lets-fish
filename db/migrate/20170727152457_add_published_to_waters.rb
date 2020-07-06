class AddPublishedToWaters < ActiveRecord::Migration[5.0]
  def change
    add_column :waters, :published, :boolean, default: false
  end
end
