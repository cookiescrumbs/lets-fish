class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :description
      t.float :latitude
      t.float :longitude
      t.datetime :date

      t.timestamps
    end
  end
end
