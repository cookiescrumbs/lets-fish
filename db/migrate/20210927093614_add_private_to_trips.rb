class AddPrivateToTrips < ActiveRecord::Migration[6.0]
  def change
    add_column :trips, :private, :boolean, default: true
  end
end
