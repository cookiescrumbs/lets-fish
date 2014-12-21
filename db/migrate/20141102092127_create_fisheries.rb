class CreateFisheries < ActiveRecord::Migration
  def change
    create_table :fisheries do |t|
      t.string :name
      t.timestamps
    end
  end
end
