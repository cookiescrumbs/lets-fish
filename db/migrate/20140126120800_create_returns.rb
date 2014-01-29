class CreateReturns < ActiveRecord::Migration
  def change
    create_table :returns do |t|
      t.text :description
      t.references :fisherman, index: true
      t.references :ticket_type, index: true

      t.timestamps
    end
  end
end
