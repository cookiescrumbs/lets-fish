class AddReturnRefToFish < ActiveRecord::Migration
  def change
    add_reference :fish, :return, index: true
  end
end
