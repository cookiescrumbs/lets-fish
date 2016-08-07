class CreateUserFisheries < ActiveRecord::Migration
  def change
  	create_table :user_fisheries, id: false do |t|
  		t.belongs_to :user
  		t.belongs_to :fishery
    end
  end
end