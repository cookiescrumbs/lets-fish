class CreateFishermen < ActiveRecord::Migration
  def change
    create_table :fishermen do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
