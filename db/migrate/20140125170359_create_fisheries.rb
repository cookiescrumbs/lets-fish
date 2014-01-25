class CreateFisheries < ActiveRecord::Migration
  def change
    create_table :fisheries do |t|
      t.string :name
      t.string :street
      t.string :line2
      t.string :city
      t.string :region
      t.string :postcode

      t.timestamps
    end
  end
end
