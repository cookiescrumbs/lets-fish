class AddFisheryRefToWaters < ActiveRecord::Migration
  def change
    add_reference :waters, :fishery, index: true
  end
end
