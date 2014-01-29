class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :type
      t.references :fishery, index: true

      t.timestamps
    end
  end
end
