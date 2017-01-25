class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.timestamps
      t.json :details, null: false, default: '{}'
    end
  end
end
