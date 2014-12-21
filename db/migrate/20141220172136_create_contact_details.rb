class CreateContactDetails < ActiveRecord::Migration
  def change
    create_table :contact_details do |t|
      t.belongs_to :fishery, index: :true
      t.string :contact_name
      t.string :telephone
      t.string :mobile
      t.string :email
      t.string :website
      t.timestamps
    end
  end
end
