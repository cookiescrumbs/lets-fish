class AddTelephoneToFishery < ActiveRecord::Migration
  def change
    add_column :fisheries, :telephone, :string
  end
end
