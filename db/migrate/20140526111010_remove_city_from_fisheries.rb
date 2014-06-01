class RemoveCityFromFisheries < ActiveRecord::Migration
  def change
    remove_column :fisheries, :city, :string
  end
end
