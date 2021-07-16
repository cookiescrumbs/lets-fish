class CreateTrips < ActiveRecord::Migration[6.0]
  def change
    create_table :trips do |t|
      t.string :title
      t.string :short_address
      t.text :description
      t.datetime :date

      t.timestamps
    end
  end
end
