class AddAttributionToImage < ActiveRecord::Migration
  def change
    add_column :images, :attribution, :text
  end
end
