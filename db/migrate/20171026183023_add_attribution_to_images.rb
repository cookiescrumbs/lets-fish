class AddAttributionToImages < ActiveRecord::Migration[5.0]
  def change
    add_column :images, :attribution, :jsonb, null: false, default: {}
  end
end
