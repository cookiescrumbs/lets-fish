class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :water, index: true
    end
  end
end
