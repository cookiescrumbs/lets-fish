class AddPermissionAndTicketsToWaters < ActiveRecord::Migration[5.0]
  def change
    add_column :waters, :permission_tickets, :text
  end
end
