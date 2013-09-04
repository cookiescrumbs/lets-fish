class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :fishery

      t.timestamps
    end
  end
end
