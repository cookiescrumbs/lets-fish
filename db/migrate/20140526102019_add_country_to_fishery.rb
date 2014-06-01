class AddCountryToFishery < ActiveRecord::Migration
  def change
    add_column :fisheries, :country, :string
  end
end
