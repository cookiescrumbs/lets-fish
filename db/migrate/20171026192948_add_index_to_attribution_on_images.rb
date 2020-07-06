class AddIndexToAttributionOnImages < ActiveRecord::Migration[5.0]
  def change
    add_index :images, :attribution, using: :gin
  end
end
