class AddWeatherToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :weather, :jsonb, null: false, default: {}
  end
end
