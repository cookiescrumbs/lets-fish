class AddEmailToFishery < ActiveRecord::Migration
  def change
    add_column :fisheries, :email, :string
  end
end
