class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text :todays_fishing
      t.text :prospects
      t.references :fishery, index: true

      t.timestamps
    end
  end
end
