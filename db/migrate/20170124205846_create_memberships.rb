class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.timestamps
      t.jsonb :details, null: false, default: '{}'
    end

    add_index  :memberships, :details, using: :gin
  end
end