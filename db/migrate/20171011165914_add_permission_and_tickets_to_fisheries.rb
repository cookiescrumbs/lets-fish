class AddPermissionAndTicketsToFisheries < ActiveRecord::Migration[5.0]
  def change
    add_column :fisheries, :permission_tickets, :text
  end
end
