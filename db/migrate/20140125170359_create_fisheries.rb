class CreateFisheries < ActiveRecord::Migration
  def change
    create_table :fisheries do |t|
      t.string :name
      t.string :contact_name
      t.string :street
      t.string :line2
      t.string :region
      t.string :country
      t.string :postcode
      t.string :telephone
      t.string :email
      t.string :website
      t.float :lng
      t.float :lat

      t.timestamps
    end
  end
end