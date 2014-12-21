class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.belongs_to :fishery, index: true
      t.string     :street
      t.string     :line2
      t.string     :region
      t.string     :country
      t.string     :postcode
      t.timestamps
    end
  end
end
