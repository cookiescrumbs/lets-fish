class CreateFisheries < ActiveRecord::Migration
  def change
    create_table :fisheries do |t|
      t.string :name
      t.string :contact_name
      t.string :street
      t.string :line2
      t.string :line3
      t.string :region
      t.string :country
      t.string :postcode
      t.string :telephone
      t.string :mobile
      t.string :email
      t.string :website
      t.text :description
      t.string :lat_lng
      t.string :prices
      t.string :record
      t.string :season
      t.string :facilities
      t.timestamps
    end
  end
end